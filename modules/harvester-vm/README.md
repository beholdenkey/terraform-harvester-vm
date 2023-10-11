# Submodule: harvester-vm

<!-- BEGIN_TF_DOCS -->

## Providers

| Name      | Version |
| --------- | ------- |
| harvester | 0.6.3   |

## Resources

| Name                                                                                                                           | Type     |
| ------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [harvester_virtualmachine.vm](https://registry.terraform.io/providers/harvester/harvester/0.6.3/docs/resources/virtualmachine) | resource |

## Inputs

| Name         | Description                                | Type                                                                                                                                                                                                             | Default | Required |
| ------------ | ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| network_name | The name of the network                    | `string`                                                                                                                                                                                                         | n/a     |   yes    |
| user_data    | User data for cloud-init configuration     | `string`                                                                                                                                                                                                         | n/a     |   yes    |
| vm_data      | Configuration data for the virtual machine | `object({ name = string namespace = string description = string hostname = string tags = map(string) cpus = number memory = string disks = list(object({ name = string size = string boot_order = number })) })` | n/a     |   yes    |
| vm_image_id  | The ID of the VM image                     | `string`                                                                                                                                                                                                         | n/a     |   yes    |
| network_data | Network data for cloud-init configuration  | `string`                                                                                                                                                                                                         | `""`    |    no    |

## Outputs

| Name  | Description                           |
| ----- | ------------------------------------- |
| vm_id | The ID of the created virtual machine |

<!-- END_TF_DOCS -->
