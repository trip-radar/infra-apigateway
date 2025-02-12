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