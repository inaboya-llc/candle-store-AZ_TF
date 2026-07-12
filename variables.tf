variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy into"
  type        = string
  default     = "centralus"
}

variable "web_app_image_tag" {
  description = "The Docker image tag for the Linux Web App"
  type        = string
  default     = "latest"
}
