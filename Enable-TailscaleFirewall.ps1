#Requires -RunAsAdministrator
[CmdletBinding()]
param()

# Docker Desktop publishes the containers' ports from its own backend, so the rule matches ports, not a program.
$ErrorActionPreference = 'Stop'
$tailscale = Join-Path $env:ProgramFiles 'Tailscale\tailscale.exe'
$status = & $tailscale status --json | ConvertFrom-Json
if ($LASTEXITCODE -ne 0 -or $status.BackendState -ne 'Running') {
    throw 'Connect Tailscale before adding the game firewall rule.'
}
$address = @($status.TailscaleIPs | Where-Object { $_ -notmatch ':' })
if ($address.Count -ne 1) {
    throw 'Expected one Tailscale IPv4 address.'
}

$ruleName = 'Revive101-Tailscale-Game'
$ruleGroup = 'Revive101 Wizard101'
$existing = Get-NetFirewallRule -Name $ruleName -ErrorAction SilentlyContinue
if ($existing -and $existing.Group -ne $ruleGroup) {
    throw 'An unrelated firewall rule already uses the requested name.'
}

$settings = @{
    Name = $ruleName
    DisplayName = 'Revive101 game over Tailscale'
    Group = $ruleGroup
    Direction = 'Inbound'
    Action = 'Allow'
    Enabled = 'True'
    Profile = 'Any'
    Protocol = 'TCP'
    LocalPort = @('12000', '12333', '12369', '12500')
    Program = 'Any'
    InterfaceAlias = 'Tailscale'
    LocalAddress = 'Any'
    RemoteAddress = '100.64.0.0/10'
}

if ($existing) {
    $settings.Remove('Name')
    $settings.Remove('DisplayName')
    $settings.Remove('Group')
    Set-NetFirewallRule -Name $ruleName @settings | Out-Null
} else {
    New-NetFirewallRule @settings | Out-Null
}
Write-Host ('Allowed Imlight and Aurorium through the Tailscale interface (current IPv4 ' + $address[0] + ').')
Write-Host 'The rule follows address changes on the Tailscale interface.'
Write-Host 'Undo: Remove-NetFirewallRule -Name Revive101-Tailscale-Game'
