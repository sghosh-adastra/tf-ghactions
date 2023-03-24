terraform {
  required_version = ">= 0.12.24"

  backend "s3" {}
}

provider "aws" {
  region = "eu-central-1"
}