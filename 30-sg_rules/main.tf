resource "aws_security_group_rule" "bastion_backend_alb" {
  type              = "ingress"
  to_port           = 80
  protocol          = "tcp"
  from_port         = 80
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.backend_alb_sg_id
}

resource "aws_security_group_rule" "public_bastion" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  cidr_blocks       =  ["0.0.0.0/0"]
  security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "bastion_mongodb" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "bastion_redis" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.redis_sg_id
}

resource "aws_security_group_rule" "bastion_rabbitmq" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.rabbitmq_sg_id
}

resource "aws_security_group_rule" "bastion_mysql" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mysql_sg_id
}

resource "aws_security_group_rule" "bastion_catalogue" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.catalogue_sg_id
}

resource "aws_security_group_rule" "catalogue_mongodb" {
  type              = "ingress"
  to_port           = 27017
  protocol          = "tcp"
  from_port         = 27017
  source_security_group_id = local.catalogue_sg_id
  security_group_id = local.mongodb_sg_id
}