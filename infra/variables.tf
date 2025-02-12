variable "region" {
  description = "AWS Region"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, prd)"
  type        = string
}

variable "state_bucket" {
  description = "Nome do bucket S3 para o state do Terraform"
  type        = string
}

variable "nlb_endpoint" {
  description = "Endpoint do NLB (ex: http://<nlb-dns-name>)"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs das subnets para o VPC Link"
  type        = list(string)
}
