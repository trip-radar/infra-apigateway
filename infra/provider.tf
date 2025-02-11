provider "aws" {
  region = var.region
}

# Exemplo de backend (opcional)
terraform {
  backend "s3" {
    bucket = var.state_bucket
    key    = "infra-apigateway/${var.environment}/terraform.tfstate"
    region = var.region
  }
}
