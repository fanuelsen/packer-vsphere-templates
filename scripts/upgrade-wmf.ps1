$url = 'https://go.microsoft.com/fwlink/?linkid=839516'
$checksum = 'a8d788fa31b02a999cc676fb546fc782e86c2a0acd837976122a1891ceee42c0'
$output = "$env:WinDir\Temp\Win8.1AndW2K12R2-KB3191564-x64.msu"

# Ensure the Windows Update service is running.
Get-Service -Name wuauserv | Start-Service

# Download the update.
(New-Object System.Net.WebClient).DownloadFile($url, $output)

# Validate the checksum.
if ((Get-FileHash -Path $output -Algorithm SHA256).Hash.ToLower() -ne $checksum) {
    Write-Output "Checksum does not match."
    exit 1
}

# Extract the contents of the msu package.
wusa.exe $output /extract:$env:WinDir\Temp

# Install the cab file wih Dism.
dism.exe /online /add-package /PackagePath:$env:WinDir\Temp\WindowsBlue-KB3191564-x64.cab /Quiet /NoRestart
# Returns 3010 to signify "reboot required"

# Stop the Windows Update service.
Get-Service -Name wuauserv | Stop-Service 