provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "examplesg" {
  name        = var.sg_example
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    Name = "teste"
    Environment = "teste2"
  }
}

resource "aws_security_group_rule" "egress" {
  description       = "description"
  protocol          = "tcp"
  security_group_id = aws_security_group.examplesg.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "ingress" {
  description       = "description"
  protocol          = "tcp"
  security_group_id = aws_security_group.examplesg.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  type              = "ingress"
}
