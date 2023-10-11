resource "harvester_image" "vm_image" {
  name         = var.name
  namespace    = var.namespace
  display_name = var.display_name
  source_type  = var.source_type
  url          = var.url
  tags         = var.tags
}

output "image_id" {
  value = harvester_image.vm_image.id
}
