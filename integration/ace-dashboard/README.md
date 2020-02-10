# Install IBM ACE Dashboard

The following artifacts are available for ACE Dashboard installation:

- [setup.sh](./setup.sh) - Utility for setting up the project for the install
- [install.sh](./install.sh) - Utility for installing ACE Dashboard
- [uninstall.sh](./uninstall.sh) - Utility for uninstalling ACE Dashboard
- [pv.yam](./pv.yaml) - Manifest for creating Persistent Volume 

The following values are changed as part of the install:

| Value                                                | Default     | Revised Default                        |
|------------------------------------------------------|-------------|----------------------------------------|
| `image.pullSecret`                                   |             | ibm-entitlement-key                    |
| `productionDeployment`                               | true        | false                                  |
| `tls.hostname`                                       |             | icp-proxy.apps.DOMAIN                  |
| `persistence.storageClassName`                       |             | "nfs" / "ibmc-file-gold" (IBMC)        |
| `replicaCount`                                       | 3           | 1                                      |

