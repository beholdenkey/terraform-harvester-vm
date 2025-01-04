# Submodule: harvester-vm-network

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| harvester | 0.6.6 |

## Resources

| Name | Type |
|------|------|
| [harvester_network.vm_network](https://registry.terraform.io/providers/harvester/harvester/0.6.6/docs/resources/network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster_network_name | Cluster network name | `string` | n/a | yes |
| name | Name of the network | `string` | n/a | yes |
| route_cidr | CIDR for the network | `string` | n/a | yes |
| route_gateway | Gateway for the network | `string` | n/a | yes |
| vlan_id | VLAN ID for the network | `string` | n/a | yes |
| namespace | Namespace of the network | `string` | `"default"` | no |
| route_mode | Route mode for the network | `string` | `"manual"` | no |

## Outputs

| Name | Description |
|------|-------------|
| network_name | The name of the network |
<!-- END_TF_DOCS -->
