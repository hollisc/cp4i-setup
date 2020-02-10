# Install AssetRepo

The following artifacts are available for AssetRepo installation:

- [setup.sh](./setup.sh) - Utility for setting up the project for the install
- [install.sh](./install.sh) - Utility for installing AssetRepo
- [uninstall.sh](./uninstall.sh) - Utility for uninstalling AssetRepo
- [pv.yam](./pv.yaml) - Manifest for creating Persistent Volume
- [pvc.yam](./pvc.yaml) - Manifest for creating Persistent Volume Claim

The following values are changed as part of the install:

| Value                                                 | Default           | Revised Default                              |
|-------------------------------------------------------|-------------------|----------------------------------------------|
| `global.images.pullSecret`                            |                   | ibm-entitlement-key                          |
| `global.tls.generate`                                 | false             | true                                         |
| `global.tls.hostname`                                 |                   | icp-proxy.apps.DOMAIN                        |
| `global.tls.secret`                                   |                   | assetrepocert                                |
| `global.persistance.storageClassName`                 |                   | "rook-ceph-block" / "ibmc-block-gold" (IBMC) |
| `global.cloudant.replicas`                            | 3                 | 1                                            |
| `prereqs.redis-ha.replicas.servers`                   | 3                 | 1                                            |
| `prereqs.redis-ha.replicas.sentinels`                 | 3                 | 1                                            |
| `wkcbase.catalog-api-charts.replicas`                 | 3                 | 1                                            |
| `wsbase.asset-files-api.deployment.replicas`          | 3                 | 1                                            |
| `wsbase.asset-files-api.persistance.storageClassName` |                   | "nfs" / "ibmc-file-gold" (IBMC)              |
| `assetSync.replicas`                                  | 3                 | 1                                            |
| `assetSync.persistance.storageClassName`              |                   | "nfs" / "ibmc-file-gold" (IBMC)              |
| `assetUI.replicas`                                    | 3                 | 1                                            |
