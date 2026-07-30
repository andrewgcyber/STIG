<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Andrew Gay
    LinkedIn        : www.linkedin.com/in/andrewgaytech
    GitHub          : https://github.com/andrewgcyber
    Date Created    : 2026-07-29
    Last Modified   : 2026-07-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE

# Run PowerShell as Administrator

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Create the key if it doesn't exist
New-Item -Path $Path -Force | Out-Null

# Set MaxSize to 0x8000 (32768 decimal)
New-ItemProperty -Path $Path `
    -Name "MaxSize" `
    -Value 32768 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Host "Application Event Log MaxSize policy has been configured successfully."
