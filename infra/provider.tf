provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = var.state_bucket
    key    = "infra-apigateway/infra/environments/${var.environment}/variables.tfstate"
    region = var.region
  }
}
