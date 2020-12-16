<div align="center">
    <img src="packerosbox.png" alt="logo" width="350px" style="margin-top: 1em">
    <h1>Packer Templates for vSphere</h1>
</div><br>

**Step1: Prepare the environemnt**
Populate variables.json or edit environment.sh to generate environment variables for vsphere. To update isos url and chksum run getiso.sh (Windows chksum takes some time)

**Variables that needs to be changed:**
| variables.json | 
|-|
```json
"vcenter_server":"0.0.0.0",
"vcenter_username":"administrator@vsphere.local",
"vcenter_password":"password",
"vsphere_cluster": "vspherecluster",
"vsphere_datacenter": "vspherepool",
"vsphere_datastore": "vspheredatastore",
"vsphere_network": "vspherevlan"
```

**Or edit and run environemnt.sh to set temp env variables**
| environment.sh | 
|-|
|```. ./environment.sh```|,
Remember both dots

**Step2: Build the template of your choosing**
| | 

```
packer build -force -only=vsphere-iso -var-file variables.json -var-file isovars.json ./linux/ubuntu/ubuntu1804.json 
packer build -force -only=vsphere-iso -var-file variables.json -var-file isovars.json ./linux/ubuntu/ubuntu2004.json 
packer build -force -only=vsphere-iso -var-file variables.json -var-file isovars.json ./linux/windows/10/win10.json
packer build -force -only=vsphere-iso -var-file variables.json -var-file isovars.json ./linux/windows/2012/gui.json
packer build -force -only=vsphere-iso -var-file variables.json -var-file isovars.json ./linux/windows/2019/core.json
packer build -force -only=vsphere-iso -var-file variables.json -var-file isovars.json ./linux/windows/2019/gui.json
```

**Credentials:**

**Linux**
Username: packer
Password: packer

**Windows**
Username: Administrator
Password: packer

**Virtual Box Builder**
There is also a virtualbox builder for some of the OS it may or may not work.

**Packer Windows Update Provisioner**
This image uses the windows update provisioner for packer read more here:
https://github.com/rgl/packer-provisioner-windows-update