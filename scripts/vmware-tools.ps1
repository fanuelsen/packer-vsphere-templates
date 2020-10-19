$file = 'setup64.exe'
$path = "E:\$file"
$args = '/s /v /qn reboot=r'
Start-Process -FilePath $path -ArgumentList $args -Wait