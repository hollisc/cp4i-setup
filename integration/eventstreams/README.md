# Install Eventstreams

The following artifacts are available for Eventstreams installation:

- [setup.sh](./setup.sh) - Utility for setting up the project for the install
- [install.sh](./install.sh) - Utility for installing Eventstreams
- [uninstall.sh](./uninstall.sh) - Utility for uninstalling Eventstreams
- [pv.yam](./pv.yaml) - Manifest for creating Persistent Volume
- [pvc.yam](./pvc.yaml) - Manifest for creating Persistent Volume Claim

The following values are changed as part of the install:

| Value                                                | Default        | Revised Default                               |
|------------------------------------------------------|----------------|-----------------------------------------------|
| `global.generateCertificate`                         | false          | true                                          |
| `global.certificateSecretName`                       |                | eventstreamcertificate                        |
| `global.image.pullSecret`                            |                | ibm-entitlement-key                           |
| `kafka.brokers`                                      | 3              | 1                                             |
| `persistence.useDynamicProvisioning`                 | false          | true                                          |
| `persistence.dataPVC.storageClassName`               |                | "rook-ceph-block" / "ibmc-block-gold" (IBMC)  |
| `zookeeper.persistence.useDynamicProvisioning`       | false          | true                                          |
| `zookeeper.persistence.storageClassName`             |                | "rook-ceph-block" / "ibmc-block-gold" (IBMC)  |
| `schema-registry.persistence.useDynamicProvisioning` | false          | true                                          |
| `schema-registry.persistence.storageClassName`       |                | "nfs" / "ibmc-file-gold" (IBMC)               |
| `license`                                            | "not accepted" | "accept"                                      |
