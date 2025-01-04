# Submodule: harvester-vm

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| harvester | 0.6.6 |

## Resources

| Name | Type |
|------|------|
| [harvester_virtualmachine.vm](https://registry.terraform.io/providers/harvester/harvester/0.6.6/docs/resources/virtualmachine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cpu | CPU cores for the virtual machine | `number` | n/a | yes |
| description | Description of the virtual machine | `string` | n/a | yes |
| hostname | Hostname of the virtual machine | `string` | n/a | yes |
| memory | Memory for the virtual machine (e.g., 2048M or 2G) | `string` | n/a | yes |
| name | Name of the virtual machine | `string` | n/a | yes |
| network_name | Name of the network for the virtual machine | `string` | n/a | yes |
| vm_image_id | The ID of the VM image | `string` | n/a | yes |
| disks | List of disks for the virtual machine | ```list(object({ name = string type = optional(string) size = optional(string) bus = optional(string) boot_order = optional(number) auto_delete = optional(bool) }))``` | `[]` | no |
| namespace | Namespace of the virtual machine | `string` | `"default"` | no |
| network_data | Network data for cloud-init configuration | `string` | `""` | no |
| tags | Tags for the virtual machine | `map(string)` | `{}` | no |
| user_data | User data for cloud-init configuration | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| vm_id | The ID of the created virtual machine |
<!-- END_TF_DOCS -->
