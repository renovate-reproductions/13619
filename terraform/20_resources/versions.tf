terraform {
  required_version = ">= 0.13"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
}
