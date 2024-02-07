resource "aws_security_group" "rds_security_group" {
  name   = var.rds_security_group_name
  vpc_id = var.vpc_id

  tags = {
    Name = var.rds_security_group_tag_name
  }
}


resource "aws_security_group_rule" "rds_ingress_rules" {
  count = length(var.rds_ingress_rules)

  security_group_id = aws_security_group.rds_security_group.id
  type              = "ingress"

  cidr_blocks = var.rds_ingress_cidr_blocks
  from_port   = var.rds_ingress_rules_from_port[count.index]
  to_port     = var.rds_ingress_rules_to_port[count.index]
  protocol    = var.rds_ingress_rules_protocols[count.index]
}

resource "aws_security_group_rule" "rds_egress_rules" {
  count = length(var.rds_egress_rules)

  security_group_id = aws_security_group.rds_security_group.id
  type              = "egress"

  cidr_blocks = var.rds_egress_cidr_blocks
  from_port   = var.rds_egress_rules_from_port[count.index]
  to_port     = var.rds_egress_rules_to_port[count.index]
  protocol    = var.rds_egress_rules_protocols[count.index]
}
