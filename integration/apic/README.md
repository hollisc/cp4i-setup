# Install IBM API Connect

The following artifacts are available for API Connect installation:

- [setup.sh](./setup.sh) - Utility for setting up the project for the install
- [install.sh](./install.sh) - Utility for installing API Connect
- [uninstall.sh](./uninstall.sh) - Utility for uninstalling API Connect

The following values are changed as part of the install:

| Value                                                | Default    | Revised Default                              |
|------------------------------------------------------|------------|----------------------------------------------|
| `productionDeployment`                               | false      | true                                         |
| `global.registrySecret`                              |            | "ibm-entitlement-key"                        |
| `global.storageClass`                                |            | "rook-ceph-block" / "ibmc-block-gold" (IBMC) |
| `global.mode`                                        | "standard" | "dev"                                        |
| `global.routingType`                                 |            | "route"                                      |
| `operator.helmTlsSecret`                             |            | "apic-ent-helm-tls"                          |
| `management.platformApiEndpoint`                     |            | mgmt.icp-proxy.DOMAIN                        |
| `management.consumerApiEndpoint`                     |            | mgmt.icp-proxy.DOMAIN                        |
| `management.cloudAdminUiEndpoint`                    |            | mgmt.icp-proxy.DOMAIN                        |
| `management.apiManagerUiEndpoint`                    |            | mgmt.icp-proxy.DOMAIN                        |
| `cassandra.cassandraClusterSize`                     | 3          | 1                                            |
| `portal.portalDirectorEndpoint`                      |            | padmin.icp-proxy.DOMAIN                      |
| `portal.portalWebEndpoint`                           |            | portal.icp-proxy.DOMAIN                      |
| `analytics.analyticsIngestionEndpoint`               |            | ai.icp-proxy.DOMAIN                          |
| `analytics.analyticsClientEndpoint`                  |            | ac.icp-proxy.DOMAIN                          |
| `gateway.apiGatewayEndpoint`                         |            | apigw.icp-proxy.DOMAIN                       |
| `gateway.gatewayServiceEndpoint`                     |            | apigwd.icp-proxy.DOMAIN                      |
| `gateway.replicaCount`                               | 3          | 1                                            |
| `gatewayhighPerformancePeering`                      |            | off                                          |
