variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy into"
  type        = string
  default     = "centralus"
}

variable "image_tag" {
  description = "The Docker image tag for the Linux Web App"
  type        = string
  default     = "latest"
}

# variable "github_sp_object_id" {
#   description = "The Object ID of the Service Principal used by GitHub Actions"
#   type        = string
# }

# variable "acr_name" {
#   description = "The globally unique name for the Azure Container Registry"
#   type        = string
# }
