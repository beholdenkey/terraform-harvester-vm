# Harvester: Virtual Machine Terraform Module

![Alt text](assets/harvester_logo.png)

Terraform modules which creates Virtual Machines on Harvester HCI

## Requirements

- A Healthy Harvester HCI Cluster or Single Node Installation
- kubeconfig file for the cluster

<!-- BEGIN_TF_DOCS -->

## Modules

| Name | Source | Version |
|------|--------|---------|
| harvester_vm | ./modules/harvester-vm | n/a |
| harvester_vm_image | ./modules/harvester-vm-image | n/a |
| harvester_vm_network | ./modules/harvester-vm-network | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster_network_name | Cluster network name | `string` | n/a | yes |
| harvester_kubeconfig_path | Path to the kubeconfig file | `string` | n/a | yes |
| image_display_name | The display name for the OS image | `string` | n/a | yes |
| image_name | The name of the OS image | `string` | n/a | yes |
| image_source_type | Source type for the image (e.g., download, upload) | `string` | n/a | yes |
| image_url | URL from where the image will be downloaded | `string` | n/a | yes |
| network_name | Name of the network | `string` | n/a | yes |
| network_vlan_id | VLAN ID for the network | `string` | n/a | yes |
| user_data | User data for cloud-init configuration | `string` | n/a | yes |
| vm_cpus | Number of CPUs for the VM | `number` | n/a | yes |
| vm_description | Description for the VM | `string` | n/a | yes |
| vm_disks | List of disks for the VM | ```list(object({ name = string # Name of the disk type = string # Type of the disk size = string # Size of the disk bus = string # Bus type of the disk boot_order = number # Boot order for the disk auto_delete = bool   # Auto delete flag for the disk }))``` | n/a | yes |
| vm_hostname | Hostname for the virtual machine | `string` | n/a | yes |
| vm_memory | Memory allocation for the VM | `string` | n/a | yes |
| vm_name | Name of the virtual machine | `string` | n/a | yes |
| image_namespace | The namespace where the image will reside | `string` | `"default"` | no |
| image_tags | Tags associated with the image | `map(string)` | `{}` | no |
| network_data | Network data for cloud-init configuration | `string` | `""` | no |
| network_namespace | Namespace of the network | `string` | `"default"` | no |
| vm_namespace | Namespace where the VM will reside | `string` | `"default"` | no |
| vm_tags | Tags associated with the VM | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| image_id | The ID of the VM image |
| network_id | The name of the network |
| vm_id | The ID of the created virtual machine |
<!-- END_TF_DOCS -->

## References

- [Harvester Terraform Provider](https://registry.terraform.io/providers/harvester/harvester/latest)
- [Harvester](https://harvesterhci.io/)
- [Terraform](https://www.terraform.io/)
- [Terragrunt](https://terragrunt.gruntwork.io/)
