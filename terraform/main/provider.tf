terraform {
  # Some syntax only works terraform > 12
  required_version = "> 0.12.0"
}

provider "aws" {
  region = var.region
}