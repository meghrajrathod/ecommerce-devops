terraform {
  required_version = ">= 1.0"

  backend "s3" {
  bucket         = "meghraj-terraform-state-375391317749"
  key            = "bootstrap/terraform.tfstate"
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

resource "aws_s3_bucket" "terraform_state" {
  bucket = "meghraj-terraform-state-375391317749"

  tags = {
    Project = "ecommerce-devops"
    Owner   = "Meghraj"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Project = "ecommerce-devops"
    Owner   = "Meghraj"
  }
}

