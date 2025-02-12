data "aws_security_group" "security_group_default" {
  name = "default" 
}

data "aws_subnets" "subnets-tripradar" {
  filter {
    name   = "tag:Name"
    values = ["tripradar-*"]
  }
}