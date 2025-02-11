# Criação do VPC Link para o API Gateway apontar para o NLB
resource "aws_apigatewayv2_vpc_link" "vpc_link" {
  name                = "trip-radar-vpc-link-${var.environment}"
  subnet_ids          = var.subnet_ids
  security_group_ids  = var.security_group_ids
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
