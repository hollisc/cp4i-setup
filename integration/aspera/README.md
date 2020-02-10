# Install Eventstreams

The following artifacts are available for Eventstreams installation:

- [setup.sh](./setup.sh) - Utility for setting up the project for the install
- [install.sh](./install.sh) - Utility for installing Eventstreams
- [uninstall.sh](./uninstall.sh) - Utility for uninstalling Eventstreams
- [pv.yam](./pv.yaml) - Manifest for creating Persistent Volume
- [pvc.yam](./pvc.yaml) - Manifest for creating Persistent Volume Claim

The following values are changed as part of the install:

| Value                                        | Default  | Revised Default                          |
|----------------------------------------------|----------|------------------------------------------|
| `productionDeployment                        | true     | false                                    |
| `redis.persistence.useDynamicProvisioning    | false    | true                                     |
| `redis.persistence.storageClassName          |          | "nfs" / "ibmc-file-gold" (IBMC)          |
| `redis.image.repository                      |          | "cp.icr.io/cp/icp4i/aspera"              |
| `redis.image.pullSecret                      |          | "ibm-entitlement-key"                    |
| `ingress.hostname                            | null     | icp-proxy.apps.DOMAIN                    |
| `persistence.useDynamicProvisioning          | true     | false                                    |
| `persistence.storageClassName                |          | "nfs" / "ibmc-file-gold" (IBMC)          |
| `asperanode.nodeCount                        | 3        | 1                                        |
| `asperanode.serverSecret                     | null     | aspera-server                            |
| `asperanode.nodeAdminSecret                  | null     | asperanode-nodeadmin                     |
| `asperanode.accessKeySecret                  | null     | asperanode-accesskey                     |
| `asperanode.image.repository                 |          | "cp.icr.io/cp/icp4i/aspera"              |
| `asperanode.autoscale.api.minReplicas        | 3        | 1                                        |
| `asperanode.autoscale.api.maxReplicas        | 5        | 1                                        |
| `aei.kafkaHost                               |          | icp-proxy.apps.DOMAIN                    |
| `aei.kafkaPort                               | 9092     | 30xxxx                                   |
| `aei.replicas                                | 3        | 1                                        |
| `aei.image.repository                        |          | "cp.icr.io/cp/icp4i/aspera"              |
| `prometheusEndpoint.replicas                 | 3        | 1                                        |
| `prometheusEndpoint.image.repository         |          | "cp.icr.io/cp/icp4i/aspera"              |
| `stats.replicas                              | 3        | 1                                        |
| `stats.image.repository                      |          | "cp.icr.io/cp/icp4i/aspera"              |
| `ascpLoadbalancer.replicas                   | 3        | 1                                        |
| `utils.image.repository                      |          | "cp.icr.io/cp/icp4i/aspera"              |
| `ascpSwarm.replicas                          | 3        | 1                                        |
| `ascpSwarm.config.maxRunning                 | 2        | 1                                        |
| `ascpSwarm.config.nodeLabels                 | {}       | {-node-role.kubernetes.io/ascp: "true"}  |
| `loadbalancer.image.repository               |          | "cp.icr.io/cp/icp4i/aspera"              |
| `nodedLoadbalancer.replicas                  | 3        | 1                                        |
| `swarm.image.repository                      |          | "cp.icr.io/cp/icp4i/aspera"              |
| `nodedSwarm.replicas                         | 3        | 1                                        |
| `nodeSwarm.config.maxRunning                 | 2        | 1                                        |
| `nodeSwarm.config.nodeLabels                 | {}       | {-node-role.kubernetes.io/noded: "true"} |
| `firstboot.image.repository                  |          | "cp.icr.io/cp/icp4i/aspera"              |
| `nodedSwarmMember.image.repository           |          | "cp.icr.io/cp/icp4i/aspera"              |
| `receiver.swarm.image.repository             |          | "cp.icr.io/cp/icp4i/aspera"              |
| `httpProxy.replicas                          | 3        | 1                                        |
| `httpProxy.image.repository                  |          | "cp.icr.io/cp/icp4i/aspera"              |
| `tcpProxy.replicas                           | 3        | 1                                        |
| `tcpProxy.image.repository                   |          | "cp.icr.io/cp/icp4i/aspera"              |
| `probe.image.repository                      |          | "cp.icr.io/cp/icp4i/aspera"              |
| `election.image.repository                   |          | "cp.icr.io/cp/icp4i/aspera"              |
| `rproxy.address                              |          | icp-proxy.apps.DOMAIN                    |
| `sch.global.image.repository                 |          | "cp.icr.io/cp/icp4i/aspera"              |
| `sch.image.pullSecret                        |          | "ibm-entitlement-key"                    |
