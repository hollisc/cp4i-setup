# Install IBM Tracing

The following artifacts are available for Tracing installation:

- [setup.sh](./setup.sh) - Utility for setting up the project for the install
- [install.sh](./install.sh) - Utility for installing Tracing
- [uninstall.sh](./uninstall.sh) - Utility for uninstalling Tracing

The following values are changed as part of the install:

| Value                                                | Default     | Revised Default                             |
|------------------------------------------------------|-------------|---------------------------------------------|
| `global.images.pullSecret`                           |             | ibm-entitlement-key                         |
| `ingress.odUiHost`                                   |             | icp-proxy.apps.DOMAIN                       |
| `platformNavigatorHost`                              |             | ibm-icp4i-prod-integration.apps.DOMAIN      |
| `elasticsearch.volumeClaimTemplate.storageClassName` |             | "rook-ceph-block" / "ibmc-block-gold"(IBMC) |
| `configdb.storageClassName`                          |             | "rook-ceph-block" / "ibmc-block-gold"(IBMC) |
