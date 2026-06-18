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

  availability_zone_1 = "ap-south-1a"
  availability_zone_2 = "ap-south-1b"

  public_subnet_1_cidr = "10.0.1.0/24"
  public_subnet_2_cidr = "10.0.2.0/24"
}