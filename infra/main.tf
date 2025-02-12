output "subnet_ids" {
  value = data.aws_subnets.subnets-tripradar.ids
}

# Criação do VPC Link para o API Gateway apontar para o NLB
resource "aws_apigatewayv2_vpc_link" "vpc_link" {
  name                = "trip-radar-vpc-link-${var.environment}"
  subnet_ids          = output.subnet_ids
  security_group_ids  = aws_security_group.security_group_nomadhub.id
}

# Criação do API Gateway usando o OpenAPI Specification
resource "aws_apigatewayv2_api" "api" {
  name          = "trip-radar-api-${var.environment}"
  protocol_type = "HTTP"
  body          = local.openapi_spec
}

# Criação do Stage para deploy automático
resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.api.id
  name        = "$default"
  auto_deploy = true
}
