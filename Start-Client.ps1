# Starts the Wizard101 client against the local server (.env GAME_SERVER_IP) or production on Fly.io.
# The client folder is CLIENT_DIR from .env, else a standard install location.
param(
    [Parameter(Mandatory = $true)][ValidateSet('local', 'production')][string]$Server
)
$productionHost = 'revive101-imlight.fly.dev'
$loginPort = 12000

function Fail($message) {
    Write-Host $message -ForegroundColor Red
    exit 1
}

function Read-DotEnv($name) {
    $envFile = Join-Path $PSScriptRoot '.env'
    if (-not (Test-Path $envFile)) {
        return $null
    }
    $line = Get-Content $envFile | Where-Object { $_ -match "^$name=" } | Select-Object -First 1
    if ($line) {
        return ($line -replace "^$name=", '').Trim().Trim("'", '"')
    }
    return $null
}

# Imlight greets every new connection, so a reply means it has finished booting. A stopped Fly machine boots on the first connection.
function Wait-ForServer($address, $timeoutSeconds) {
    $deadline = (Get-Date).AddSeconds($timeoutSeconds)
    while ((Get-Date) -lt $deadline) {
        $client = New-Object Net.Sockets.TcpClient
        try {
            $client.Connect($address, $loginPort)
            $stream = $client.GetStream()
            $stream.ReadTimeout = 10000
            if ($stream.Read((New-Object byte[] 64), 0, 64) -gt 0) {
                return $true
            }
        }
        catch {
        }
        finally {
            $client.Close()
        }
        Start-Sleep -Seconds 3
    }
    return $false
}

$clientDir = Read-DotEnv 'CLIENT_DIR'
if ($clientDir -and -not [IO.Path]::IsPathRooted($clientDir)) {
    $clientDir = Join-Path $PSScriptRoot $clientDir
}
$candidates = @(
    $clientDir,
    "${env:ProgramData}\KingsIsle Entertainment\Wizard101",
    "${env:ProgramFiles(x86)}\Steam\steamapps\common\Wizard101"
) | Where-Object { $_ -and (Test-Path (Join-Path $_ 'Bin\WizardGraphicalClient.exe')) }
$clientDir = $candidates | Select-Object -First 1
if (-not $clientDir) {
    Fail 'No Wizard101 client found. Set CLIENT_DIR in .env to the client folder (the one that holds Bin).'
}
$bin = Join-Path $clientDir 'Bin'

if ($Server -eq 'local') {
    $address = Read-DotEnv 'GAME_SERVER_IP'
    if (-not $address) {
        Fail 'GAME_SERVER_IP is not set in .env.'
    }
    Write-Host "Checking the local server at $address..."
    if (-not (Wait-ForServer $address 10)) {
        Fail "The local server isn't answering at ${address}:$loginPort. Start it with docker compose up -d."
    }
}
else {
    try {
        $address = ([Net.Dns]::GetHostAddresses($productionHost) | Where-Object { $_.AddressFamily -eq 'InterNetwork' } | Select-Object -First 1).IPAddressToString
    }
    catch {
    }
    if (-not $address) {
        Fail "Could not look up $productionHost. Check your internet connection."
    }
    Write-Host "Waking the production server at $address (up to a few minutes if it was asleep)..."
    if (-not (Wait-ForServer $address 240)) {
        Fail "The production server isn't answering at ${address}:$loginPort. Check fly status -a revive101-imlight."
    }
}

Write-Host "Starting Wizard101 against ${address}:$loginPort"
Start-Process -FilePath (Join-Path $bin 'WizardGraphicalClient.exe') -WorkingDirectory $bin -ArgumentList '-L', $address, $loginPort
