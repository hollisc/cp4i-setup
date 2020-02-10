# Install IBM DataPower 

The following artifacts are available for DataPower installation:

- [setup.sh](./setup.sh) - Utility for setting up the project for the install
- [install.sh](./install.sh) - Utility for installing DataPower
- [uninstall.sh](./uninstall.sh) - Utility for uninstalling DataPower

The following values are changed as part of the install:

| Value                                 | Default            | Revised Default                        |
|---------------------------------------|--------------------|----------------------------------------|
| `datapower.image.pullSecret`          |                    | ibm-entitlement-key                    |
| `datapower.resources.limits.cpu`      | 8                  | 4                                      |
| `datapower.resources.limits.memory`   | 64Gi               | 8Gi                                    |
