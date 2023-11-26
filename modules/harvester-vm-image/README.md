# Submodule - harvester-vm-image

<!-- BEGIN_TF_DOCS -->

## Providers

| Name      | Version |
| --------- | ------- |
| harvester | 0.6.3   |

## Resources

| Name                                                                                                               | Type     |
| ------------------------------------------------------------------------------------------------------------------ | -------- |
| [harvester_image.vm_image](https://registry.terraform.io/providers/harvester/harvester/0.6.3/docs/resources/image) | resource |

## Inputs

| Name               | Description                                           | Type          | Default     | Required |
| ------------------ | ----------------------------------------------------- | ------------- | ----------- | :------: |
| display_name       | The display name for the OS image                     | `string`      | n/a         |   yes    |
| name               | The name of the OS image                              | `string`      | n/a         |   yes    |
| source_type        | Source type for the image (e.g., download, upload)    | `string`      | n/a         |   yes    |
| url                | URL from where the image will be downloaded           | `string`      | n/a         |   yes    |
| description        | Any text you want that better describes this resource | `string`      | `""`        |    no    |
| namespace          | The namespace where the image will reside             | `string`      | `"default"` |    no    |
| pvc_name           | PVC Name                                              | `string`      | `null`      |    no    |
| pvc_namespace      | PVC Namespace                                         | `string`      | `null`      |    no    |
| storage_class_name | The name of the storage class                         | `string`      | `null`      |    no    |
| tags               | Tags associated with the image                        | `map(string)` | `{}`        |    no    |

## Outputs

| Name     | Description            |
| -------- | ---------------------- |
| image_id | The ID of the VM image |

<!-- END_TF_DOCS -->
