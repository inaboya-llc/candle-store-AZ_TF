terraform {
  required_version = ">= 1.3"
  
  cloud {
    organization = "inaboya-tfc"

    workspaces {
      # Replacing 'name' with 'tags' allows GitHub Actions to dynamically pick the workspace
      tags = ["azure"]
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}

