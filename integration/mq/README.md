# Install MQ

The following artifacts are available for MQ installation:

- [setup.sh](./setup.sh) - Utility for setting up the project for the install
- [install.sh](./install.sh) - Utility for installing MQ
- [uninstall.sh](./uninstall.sh) - Utility for uninstalling MQ
- [pv.yam](./pv.yaml) - Manifest for creating Persistent Volume
- [pvc.yam](./pvc.yaml) - Manifest for creating Persistent Volume Claim
- [mq-role-binding.yaml](./mq-role-binding.yaml) - Manifest for creating required MQ Role Binding 
- [mq-role.yaml](./mq-role.yaml) - Manifest for creating required MQ Role

The following values are changed as part of the install:

| Value                                                | Default        | Revised Default                     |
|------------------------------------------------------|----------------|-------------------------------------|
| `license`                                            | "not accepted" | "accept"                            |  
| `productionDeployment`                               | true           | false                               | 
| `image.pullSecret`                                   |                | ibm-entitlement-key                 | 
| `tls.generate`                                       | false          | true                                |
| `tls.hostname`                                       |                | icp-proxy.apps.DOMAIN               | 
| `storageClassName`                                   |                | "nfs" / "ibmc-file-gold"(IBMC)      | 
| `dataPVC.storageClassName'                           |                | "nfs" / "ibmc-file-gold"(IBMC)      | 
| `logPVC.storageClassName`                            |                | "nfs" / "ibmc-file-gold"(IBMC)      | 
| `queueManager.name`                                  |                | "MYQMGR"                            |
