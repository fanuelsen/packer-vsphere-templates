# When NOT USING a domain-based authentication, remember to disable this after VM provisoning!
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'