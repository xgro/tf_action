# Required providers configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6.0"
    }
  }

  backend "s3" {
    bucket = "xgro-test-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-2"
    # dynamodb_table  = aws_dynamodb_table.terraform_state_lock.id
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }

  required_version = ">= 1.0.11"
}

# AWS provider configuration
# provider "aws" {
#   profile = "aws"
#   region  = "ap-northeast-2"
# }

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}






