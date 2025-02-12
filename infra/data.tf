data "aws_security_group" "security_group_default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }
}

data "aws_subnets" "subnets-tripradar" {
  filter {
    name   = "tag:Name"
    values = ["tripradar-*"]
  }
}

data "aws_cognito_user_pool" "cognito_user_pool" {
  name = local.cognito_user_pool_name
}
