<div align="center">
    <img src="packerosbox.png" alt="logo" width="350px" style="margin-top: 1em">
    <h1>Packer Templates for vSphere</h1>
</div><br>

**Step1: Prepare the environemnt**
Populate variables.json or edit environment.sh to generate environment variables for vsphere. To update isos url and chksum run getiso.sh (Windows chksum takes some time)

**Variables that needs to be changed:**
| variables.json | 
|-|
|```"vcenter_server":"0.0.0.0",```|
|```"vcenter_username":"administrator@vsphere.local",```|
|```"vcenter_password":"password",``` |
|```"vsphere_cluster": "vspherecluster",```|
|```"vsphere_datacenter": "vspherepool",```|
|```"vsphere_datastore": "vspheredatastore",```|
|```"vsphere_network": "vspherevlan"```|

**Or edit and run environemnt.sh to set temp env variables**
| environment.sh | 
|-|
|```. ./environment.sh```|
Remember both dots


**Step2: Build the template**
To create a template execute **packer build -force -only=vsphere-iso -var-file variables.json -var-file isovars.json ./linux/ubuntu/ubuntu1804.json** 

**Credentials:**

**Linux**
Username: packer
Password: packer

**Windows**
Username: Administrator
Password: packer