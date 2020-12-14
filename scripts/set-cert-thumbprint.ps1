# Gets the thumbprint from the certificate generated in the autounattend.xml config.
$thumbprint = ( Get-ChildItem -Path cert: -Recurse | Where-Object { $_.subject -eq "CN=WinRMCert" } | Select-Object -ExpandProperty Thumbprint | Select-Object -First 1 )

# Sets the correct thumbprint on service. This is only needed for 2012R2 and below.
winrm set winrm/config/service "@{CertificateThumbprint=`"$($thumbprint)`"}"