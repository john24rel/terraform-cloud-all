provider "aws" {
  region = var.region
  version = "3.18.0"
}

terraform {
  required_version = "0.12.19"
}
