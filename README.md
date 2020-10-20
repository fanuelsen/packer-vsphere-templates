<div align="center">
    <img src="packerosbox.png" alt="logo" width="350px" style="margin-top: 1em">
    <h1>Packer Templates for vSphere</h1>
</div><br>

**Step1: Prepare the environemnt**
Populate variables.json and run environment.sh to generate newest isos url and chksum. (Windows chksum takes some time)

**Variables that needs to be changed:**
| variables.json | 
|-|
|```"vcenter_server":"0.0.0.0",```|
|```"vcenter_username":"administrator@vsphere.local",```|
|```"vcenter_password":"password",``` |
|```"vsphere_cluster": "vspherecluser",```|
|```"vsphere_datacenter": "vspherepool",```|
|```"vsphere_datastore": "vspheredatastore",```|

**Step2: Build the template**
To create the template execute **packer build -force -var-file variables.json -var-file isovars.json ./linux/ubuntu/ubuntu1804.json** 

**Credentials:**
Username: packer
Password: packer