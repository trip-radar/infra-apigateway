locals {
  openapi_spec = templatefile("${path.module}/openapi.yml", {
    environment           = var.environment,
    vpc_link_id           = aws_apigatewayv2_vpc_link.vpc_link.id,
    nlb_endpoint          = var.nlb_endpoint,
    cognito_user_pool_arn = data.aws_cognito_user_pool.this.arn
  })

  name_security_group = "nomad-hub-api-security-group"  
}
