terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # this specifies a version constraint
    }
  }

  required_version = ">=1.5.0" # required Terraform core
}

provider "aws" {
  region = "me-central-1" # AWS Dubai region

  default_tags {
    tags = {
      business    = "dandbdubai"
      department  = "ict"
      project     = "portal-listing-manager"
      stakeholder = "vicente.villasoto"
    }
  }
}