# Doc: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  # Cloud Block that integrates HCP in the local Terraform
  cloud {
    organization = "brambillagabrielle-hcp"

    workspaces {
      name = "demo-workspace"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}