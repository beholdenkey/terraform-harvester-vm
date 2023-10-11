# Harvester: Virtual Machine Terraform Module

![Alt text](assets/harvester_logo.png)

Terraform modules which creates Virtual Machines on Harvester HCI

## Requirements

- Harvester HCI Cluster
- kubeconfig file for the cluster

## Usage

```hcl
module "virtual_machine" {
  source = "../../"

  replicas    = 3
  name        = "kubernetes"
  namespace   = "default"
  description = "Virtual machines in the form of worker nodes for a Kubernetes cluster"

  machine_type = "q35"

  cpu    = 2
  memory = "4Gi"

  ssh_keys = []

  network_interface {
    name         = "vlan-9asj2l"
    network_name = harvester_network.vlan-9asj2l.id
  }

  disk {
    name        = "disk-9aulwi"
    type        = "disk"
    size        = "10Gi"
    bus         = "virtio"
    boot_order  = 1
  }

  disk {
    name        = "cd-ais90d"
    type        = "cd-rom"
    size        = "10Gi"
    bus         = "sata"
    boot_order  = 1
    image       = harvester_image.opensuse-15-4.id
    auto_delete = true
  }

  cloudinit {
    user_data = <<-EOF
      #cloud-config
      EOF
  }
}
```

## Providers

| Name      | Version |
| --------- | ------- |
| harvester | 0.6.2   |
| random    | 3.5.1   |

## Resources

| Name                                                                                                                                 | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [harvester_virtualmachine.default](https://registry.terraform.io/providers/harvester/harvester/latest/docs/resources/virtualmachine) | resource |
| [random_string.name_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                   | resource |

## Inputs

| Name                 | Description                                                                                                          | Type                                                                                                                                                                                                                                                                                              | Default     | Required |
| -------------------- | -------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | :------: |
| disk                 | The disk(s) to be assigned to the virtual machine(s)                                                                 | `object({ name = string access_mode = bool auto_delete = number boot_order = string bus = string container_image_name = string existing_volume_name = string hot_plug = bool image = string size = string storage_class_name = string type = string volume_mode = string volume_name = string })` | n/a         |   yes    |
| name                 | Name prefix used when creating multiple virtual machines, if count is set to one the hyphen is trimmed from the name | `string`                                                                                                                                                                                                                                                                                          | n/a         |   yes    |
| network_interface    | The network interface(s) to be assigned to the virtual machine(s)                                                    | `object({ name = string mac_address = string model = string network_name = string type = string wait_for_lease = bool })`                                                                                                                                                                         | n/a         |   yes    |
| replicas             | Amount of virtual machine(s) to create for the configuration                                                         | `number`                                                                                                                                                                                                                                                                                          | n/a         |   yes    |
| reserved_memory      | Amount of reserved memory to be assigned to the virtual machine(s)                                                   | `string`                                                                                                                                                                                                                                                                                          | n/a         |   yes    |
| cloudinit            | The cloud_init configuration to be used on the virtual machine(s)                                                    | `object({ user_data = string user_data_base64 = string user_data_secret_name = string type = string network_data = string network_data_base64 = string network_data_secret_name = string })`                                                                                                      | `null`      |    no    |
| cpu                  | Amount of cpu cores to be assigned to the virtual machine(s)                                                         | `number`                                                                                                                                                                                                                                                                                          | `1`         |    no    |
| description          | Description for the virtual machine(s)                                                                               | `string`                                                                                                                                                                                                                                                                                          | `""`        |    no    |
| efi                  | Determines if EFI system partition is to exist on the virtual machines data storage                                  | `bool`                                                                                                                                                                                                                                                                                            | `true`      |    no    |
| machine_type         | The machine type for the virtual machine(s).                                                                         | `string`                                                                                                                                                                                                                                                                                          | `"q35"`     |    no    |
| memory               | Amount of memory to be assigned to the virtual machine(s)                                                            | `string`                                                                                                                                                                                                                                                                                          | `"2Gi"`     |    no    |
| namespace            | Namespace in which the virtual machine(s) is/are to be placed                                                        | `string`                                                                                                                                                                                                                                                                                          | `"default"` |    no    |
| restart_after_update | Whether to restart the virtual machine(s) after updating                                                             | `bool`                                                                                                                                                                                                                                                                                            | `true`      |    no    |
| run_strategy         | Run strategy for the virtual machine(s) (options: Always, RerunOnFailure, Manual, Halted)                            | `string`                                                                                                                                                                                                                                                                                          | `"Always"`  |    no    |
| secure_boot          | Determines if the virtual machines are to be booted in secure modus. EFI must be enabled to use this feature         | `bool`                                                                                                                                                                                                                                                                                            | `false`     |    no    |
| ssh_keys             | List of SSH keys to be added to the virtual machine(s)                                                               | `list(any)`                                                                                                                                                                                                                                                                                       | `[]`        |    no    |
| tags                 | Tags to be placed on the virtual machine(s)                                                                          | `map(string)`                                                                                                                                                                                                                                                                                     | `{}`        |    no    |

## Outputs

| Name  | Description                         |
| ----- | ----------------------------------- |
| id    | The id of the virtual machine(s)    |
| state | The state of the virtual machine(s) |

## References

- [Harvester](https://harvesterhci.io/)
- [Terraform](https://www.terraform.io/)
- [Terragrunt](https://terragrunt.gruntwork.io/)
- [Harvester Terraform Module](https://registry.terraform.io/providers/harvester/harvester/latest)

<!-- BEGIN_TF_DOCS -->

# Usage

```hcl
resource "random_string" "name_suffix" {
  length  = 4
  special = false
  upper   = false
  lower   = true
  numeric = true
}

// Harvester virtual machine resource creation
resource "harvester_virtualmachine" "default" {
  count = var.replicas

  name        = format("%s-%d-%s", var.name, count.index, random_string.name_suffix.result)
  hostname    = format("%s-%d-%s", var.name, count.index, random_string.name_suffix.result)
  namespace   = var.namespace
  description = var.description

  restart_after_update = var.restart_after_update
  run_strategy         = var.run_strategy
  machine_type         = var.machine_type
  cpu                  = var.cpu
  memory               = var.memory
  reserved_memory      = var.reserved_memory
  ssh_keys             = var.ssh_keys
  efi                  = var.efi
  secure_boot          = var.secure_boot

  // Network interface configuration for VM
  dynamic "network_interface" {
    for_each = var.network_interface
    content {
      name           = network_interface.value["name"]
      mac_address    = network_interface.value["mac_address"]
      model          = network_interface.value["model"]
      network_name   = network_interface.value["network_name"]
      type           = network_interface.value["type"]
      wait_for_lease = network_interface.value["wait_for_lease"]
    }
  }

  // Disk configuration for VM
  dynamic "disk" {
    for_each = var.disk
    content {
      name                 = disk.value["name"]
      access_mode          = disk.value["access_mode"]
      auto_delete          = disk.value["auto_delete"]
      boot_order           = disk.value["boot_order"]
      bus                  = disk.value["bus"]
      container_image_name = disk.value["container_image_name"]
      existing_volume_name = disk.value["existing_volume_name"]
      hot_plug             = disk.value["hot_plug"]
      image                = disk.value["image"]
      size                 = disk.value["size"]
      storage_class_name   = disk.value["storage_class_name"]
      type                 = disk.value["type"]
      volume_mode          = disk.value["volume_mode"]
      volume_name          = disk.value["volume_name"]
    }
  }

  // Cloud-init configuration for VM
  dynamic "cloudinit" {
    for_each = var.cloudinit
    iterator = cloudinit_iter
    content {
      user_data                = cloudinit_iter.value["user_data"]
      user_data_base64         = cloudinit_iter.value["user_data_base64"]
      user_data_secret_name    = cloudinit_iter.value["user_data_secret_name"]
      type                     = cloudinit_iter.value["type"]
      network_data             = cloudinit_iter.value["network_data"]
      network_data_base64      = cloudinit_iter.value["network_data_base64"]
      network_data_secret_name = cloudinit_iter.value["network_data_secret_name"]
    }
  }

  tags = merge(
    {
      "name" = format("%s", var.name)
    },
    var.tags,
  )

  // Provisioning script with better error message
  provisioner "local-exec" {
    when       = create
    command    = "echo 'An error occurred while creating VM: ${self.name}'"
    on_failure = continue
  }

  // Destroy script to clean up in case of an error
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destroying VM: ${self.name}'"
  }
}
```

## Providers

| Name      | Version  |
| --------- | -------- |
| harvester | 0.6.2    |
| random    | ~> 3.5.1 |

## Resources

| Name                                                                                                                                | Type     |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [harvester_virtualmachine.default](https://registry.terraform.io/providers/harvester/harvester/0.6.2/docs/resources/virtualmachine) | resource |
| [random_string.name_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                  | resource |

## Inputs

| Name                 | Description                                                                                                          | Type                                                                                                                                                                                                                                                                                              | Default     | Required |
| -------------------- | -------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | :------: |
| disk                 | The disk(s) to be assigned to the virtual machine(s)                                                                 | `object({ name = string access_mode = bool auto_delete = number boot_order = string bus = string container_image_name = string existing_volume_name = string hot_plug = bool image = string size = string storage_class_name = string type = string volume_mode = string volume_name = string })` | n/a         |   yes    |
| name                 | Name prefix used when creating multiple virtual machines, if count is set to one the hyphen is trimmed from the name | `string`                                                                                                                                                                                                                                                                                          | n/a         |   yes    |
| network_interface    | The network interface(s) to be assigned to the virtual machine(s)                                                    | `object({ name = string mac_address = string model = string network_name = string type = string wait_for_lease = bool })`                                                                                                                                                                         | n/a         |   yes    |
| replicas             | Amount of virtual machine(s) to create for the configuration                                                         | `number`                                                                                                                                                                                                                                                                                          | n/a         |   yes    |
| reserved_memory      | Amount of reserved memory to be assigned to the virtual machine(s)                                                   | `string`                                                                                                                                                                                                                                                                                          | n/a         |   yes    |
| cloudinit            | The cloud_init configuration to be used on the virtual machine(s)                                                    | `object({ user_data = string user_data_base64 = string user_data_secret_name = string type = string network_data = string network_data_base64 = string network_data_secret_name = string })`                                                                                                      | `null`      |    no    |
| cpu                  | Amount of cpu cores to be assigned to the virtual machine(s)                                                         | `number`                                                                                                                                                                                                                                                                                          | `1`         |    no    |
| description          | Description for the virtual machine(s)                                                                               | `string`                                                                                                                                                                                                                                                                                          | `""`        |    no    |
| efi                  | Determines if EFI system partition is to exist on the virtual machines data storage                                  | `bool`                                                                                                                                                                                                                                                                                            | `true`      |    no    |
| machine_type         | The machine type for the virtual machine(s).                                                                         | `string`                                                                                                                                                                                                                                                                                          | `"q35"`     |    no    |
| memory               | Amount of memory to be assigned to the virtual machine(s)                                                            | `string`                                                                                                                                                                                                                                                                                          | `"2Gi"`     |    no    |
| namespace            | Namespace in which the virtual machine(s) is/are to be placed                                                        | `string`                                                                                                                                                                                                                                                                                          | `"default"` |    no    |
| restart_after_update | Whether to restart the virtual machine(s) after updating                                                             | `bool`                                                                                                                                                                                                                                                                                            | `true`      |    no    |
| run_strategy         | Run strategy for the virtual machine(s) (options: Always, RerunOnFailure, Manual, Halted)                            | `string`                                                                                                                                                                                                                                                                                          | `"Always"`  |    no    |
| secure_boot          | Determines if the virtual machines are to be booted in secure modus. EFI must be enabled to use this feature         | `bool`                                                                                                                                                                                                                                                                                            | `false`     |    no    |
| ssh_keys             | List of SSH keys to be added to the virtual machine(s)                                                               | `list(any)`                                                                                                                                                                                                                                                                                       | `[]`        |    no    |
| tags                 | Tags to be placed on the virtual machine(s)                                                                          | `map(string)`                                                                                                                                                                                                                                                                                     | `{}`        |    no    |

## Outputs

| Name  | Description                         |
| ----- | ----------------------------------- |
| id    | The id of the virtual machine(s)    |
| state | The state of the virtual machine(s) |

<!-- END_TF_DOCS -->
