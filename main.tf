terraform {
  required_version = ">= 0.12.24"

  backend "s3" {
    bucket = "adastra-tsg-ghactions-tf"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}