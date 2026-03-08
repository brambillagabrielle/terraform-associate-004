# Doc: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  # Tags that will be applied to any resource created with this Provider
  default_tags {
    tags = {
      Managed_By = "Terraform"
    }
  }
}