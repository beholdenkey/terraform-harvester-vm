variable "name" {
  description = "The name of the OS image"
  type        = string
}

variable "namespace" {
  description = "The namespace where the image will reside"
  type        = string
}

variable "display_name" {
  description = "The display name for the OS image"
  type        = string
}

variable "source_type" {
  description = "Source type for the image (e.g., download, upload)"
  type        = string
  validation {
    condition     = var.source_type == "download" || var.source_type == "upload"
    error_message = "The source_type can only be 'download' or 'upload'."
  }
}

variable "url" {
  description = "URL from where the image will be downloaded"
  type        = string
}

variable "tags" {
  description = "Tags associated with the image"
  type        = map(string)
  default     = {}
}
