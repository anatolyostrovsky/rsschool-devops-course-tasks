terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

    local = {
      source = "hashicorp/local"

    }
  }

  required_version = ">= 0.14"

  backend "s3" {
    bucket  = "rsschool-tfstate"
    key     = "state/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true


  }
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
