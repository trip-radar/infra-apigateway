resource "aws_security_group" "security_group_nomadhub" {
  name        = local.name_security_group
  description = "Security Group para API do Nomad"
  vpc_id      = data.aws_security_group.security_group_default.vpc_id  

  tags = {
    Name = local.name_security_group
  }
}

resource "aws_security_group_rule" "ingress_rules" {
  for_each = { for rule in data.aws_security_group.security_group_default.ingress : rule.description => rule }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.new_group.id
  description       = each.value.description
}

resource "aws_security_group_rule" "egress_rules" {
  for_each = { for rule in data.aws_security_group.security_group_default.egress : rule.description => rule }

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.new_group.id
  description       = each.value.description
}