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
    google = {
      source  = "hashicorp/google"
      version = ">= 5.26.0, < 8"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-east4"
}

