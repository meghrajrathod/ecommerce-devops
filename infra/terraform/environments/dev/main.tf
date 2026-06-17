terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "meghraj-terraform-state-375391317749"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"

  project_name = "ecommerce-devops"
  vpc_cidr     = "10.0.0.0/16"
}