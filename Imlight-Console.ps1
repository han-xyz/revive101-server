# Opens Imlight's server console on Fly.io, starting the machine first if it has stopped.
# Arguments run one console command instead, for example: account create <user> <password>
$app = 'revive101-imlight'
$consoleSocket = '/app/run/imlight-console.sock'
$console = 'cd /app && exec setpriv --reuid=1654 --regid=1654 --clear-groups dotnet Imlight.Director.dll console'

# flyctl writes progress to stderr, which PowerShell 5.1 turns into errors, so failures are checked by exit code.
function Fail($message) {
    Write-Host $message -ForegroundColor Red
    exit 1
}

$fly = (Get-Command fly.exe -ErrorAction SilentlyContinue).Source
if (-not $fly) {
    $fly = Join-Path $env:USERPROFILE '.fly\bin\fly.exe'
}
if (-not (Test-Path $fly)) {
    Fail 'flyctl is not installed. Install it from https://fly.io/docs/flyctl/install/ and run fly auth login.'
}

& $fly auth whoami *> $null
if ($LASTEXITCODE -ne 0) {
    Fail 'flyctl is not logged in. Run fly auth login.'
}

$machine = & $fly machine list -a $app --json 2> $null | ConvertFrom-Json | Select-Object -First 1
if (-not $machine) {
    Fail "App $app has no machine, or you can't access it. Deploy it first (README, Fly.io)."
}
if ($machine.state -ne 'started') {
    Write-Host 'Starting the server...'
    & $fly machine start $machine.id -a $app *> $null
    if ($LASTEXITCODE -ne 0) {
        Fail "Could not start machine $($machine.id). Check fly status -a $app."
    }
}

Write-Host 'Waiting for the server console...'
$deadline = (Get-Date).AddMinutes(3)
while ($true) {
    & $fly ssh console -a $app -C "test -S $consoleSocket" *> $null
    if ($LASTEXITCODE -eq 0) {
        break
    }
    if ((Get-Date) -gt $deadline) {
        Fail "The server console did not come up. Check fly logs -a $app."
    }
    Start-Sleep -Seconds 5
}

# Fly stops the machine when no player is connected, and SSH doesn't count, so hold a game-port connection open meanwhile.
$keepAwake = Start-Job -ArgumentList "$app.fly.dev" -ScriptBlock {
    param($hostName)
    while ($true) {
        $client = New-Object Net.Sockets.TcpClient
        try {
            $client.Connect($hostName, 12000)
            while (-not ($client.Client.Poll(0, [Net.Sockets.SelectMode]::SelectRead) -and $client.Client.Available -eq 0)) {
                Start-Sleep -Seconds 15
            }
        }
        catch {
        }
        finally {
            $client.Close()
        }
        Start-Sleep -Seconds 5
    }
}

try {
    if ($args.Count -gt 0) {
        & $fly ssh console -a $app -C "sh -c '$console $($args -join ' ')'" 2> $null
    }
    else {
        Write-Host 'Connected. Type help for commands, exit to leave.'
        & $fly ssh console -a $app --pty -C "sh -c '$console'"
    }
    $result = $LASTEXITCODE
}
finally {
    Stop-Job $keepAwake
    Remove-Job $keepAwake
}
exit $result
