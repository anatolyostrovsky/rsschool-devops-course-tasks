terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 0.14"
}

provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      application = var.app
      env         = var.env
    }
  }
}
