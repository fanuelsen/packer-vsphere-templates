Function Cleanup { 

    Clear-Host

    ## Stops the windows update service.
    Get-Service -Name wuauserv | Stop-Service -Force -Verbose -ErrorAction SilentlyContinue

    ## Deletes the contents of windows software distribution.
    Get-ChildItem "C:\Windows\SoftwareDistribution\*" -Recurse -Force -Verbose -ErrorAction SilentlyContinue | Remove-Item -Force -Verbose -recurse -ErrorAction SilentlyContinue

    ## Deletes the contents of the Windows Temp folder.
    Get-ChildItem "C:\Windows\Temp\*" -Recurse -Force -Verbose -ErrorAction SilentlyContinue | Remove-Item -Force -Verbose -recurse -ErrorAction SilentlyContinue

    ## Delets all files and folders in user's Temp folder.
    Get-ChildItem "C:\users\*\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Verbose -recurse -ErrorAction SilentlyContinue

    ## Remove all files and folders in user's Temporary Internet Files.
    Get-ChildItem "C:\users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -Verbose -ErrorAction SilentlyContinue | Remove-Item -Force -recurse -ErrorAction SilentlyContinue
}

Cleanup

#$package = "SDelete.zip"
#$url = "https://download.sysinternals.com/files/$package"
#Write-Output "***** Downloading SDelete"
#Invoke-WebRequest $url -UseBasicParsing -OutFile "C:\Windows\Temp\$package"
#Write-Output "***** Expanding SDelete"
#Expand-Archive -LiteralPath "C:\Windows\Temp\$package" -DestinationPath "C:\Windows"

#Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
#Optimize-Volume -DriveLetter C
#sdelete -q -z c: