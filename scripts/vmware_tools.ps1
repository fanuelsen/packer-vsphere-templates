$file = 'setup64.exe'
$path = "E:\$file"
$arg = '/s /v /qn reboot=r'
Start-Process -FilePath $path -ArgumentList $arg -Wait