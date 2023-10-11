resource "harvester_image" "vm_image" {
  name               = var.name
  namespace          = var.namespace
  display_name       = var.display_name
  source_type        = var.source_type
  url                = var.url
  tags               = var.tags
  description        = var.description
  storage_class_name = var.storage_class_name
  pvc_name           = var.pvc_name
  pvc_namespace      = var.pvc_namespace
}
