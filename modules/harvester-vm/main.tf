resource "harvester_virtualmachine" "vm" {
  depends_on = [var.vm_image_id]

  name         = var.vm_data.name
  namespace    = var.vm_data.namespace
  description  = var.vm_data.description
  hostname     = var.vm_data.hostname
  tags         = var.vm_data.tags
  cpu          = var.vm_data.cpus
  memory       = var.vm_data.memory
  run_strategy = "RerunOnFailure"

  network_interface {
    name         = "nic-0"
    network_name = var.network_name # Reference to the network name variable
  }

  dynamic "disk" {
    for_each = var.vm_data.disks
    content {
      name        = disk.value.name
      type        = "disk"
      size        = disk.value.size
      bus         = "virtio"
      boot_order  = disk.value.boot_order
      image       = var.vm_image_id # Reference to the VM image ID variable
      auto_delete = true
    }
  }

  cloudinit {
    user_data    = var.user_data
    network_data = var.network_data
  }
}
