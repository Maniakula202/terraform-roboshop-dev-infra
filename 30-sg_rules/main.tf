### bastion ###

resource "aws_security_group_rule" "public_bastion" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  cidr_blocks       =  ["0.0.0.0/0"]
  security_group_id = local.bastion_sg_id
}


### MongoDB ###

resource "aws_security_group_rule" "bastion_mongodb" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "catalogue_mongodb" {
  type              = "ingress"
  to_port           = 27017
  protocol          = "tcp"
  from_port         = 27017
  source_security_group_id = local.catalogue_sg_id
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_user" {
  type              = "ingress"
  security_group_id = local.mongodb_sg_id
  source_security_group_id = local.user_sg_id
  from_port         = 27017
  protocol          = "tcp"
  to_port           = 27017
}

### Redis ###

resource "aws_security_group_rule" "bastion_redis" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.redis_sg_id
}

resource "aws_security_group_rule" "user_redis" {
  type              = "ingress"
  to_port           = 6379
  protocol          = "tcp"
  from_port         = 6379
  source_security_group_id = local.user_sg_id
  security_group_id = local.redis_sg_id
}

resource "aws_security_group_rule" "cart_redis" {
  type              = "ingress"
  to_port           = 6379
  protocol          = "tcp"
  from_port         = 6379
  source_security_group_id = local.cart_sg_id
  security_group_id = local.redis_sg_id
}

### Mysql ###

resource "aws_security_group_rule" "bastion_mysql" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mysql_sg_id
}

resource "aws_security_group_rule" "shipping_mysql" {
  type              = "ingress"
  to_port           = 3306
  protocol          = "tcp"
  from_port         = 3306
  source_security_group_id = local.shipping_sg_id
  security_group_id = local.mysql_sg_id
}

### Rabbitmq ###

resource "aws_security_group_rule" "bastion_rabbitmq" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.rabbitmq_sg_id
}

resource "aws_security_group_rule" "payment_rabbitmq" {
  type              = "ingress"
  to_port           = 5672
  protocol          = "tcp"
  from_port         = 5672
  source_security_group_id = local.payment_sg_id
  security_group_id = local.rabbitmq_sg_id
}

### Catalogue ###

resource "aws_security_group_rule" "bastion_catalogue" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.catalogue_sg_id
}

resource "aws_security_group_rule" "backend_alb_catalogue" {
  type              = "ingress"
  to_port           = 8080
  protocol          = "tcp"
  from_port         = 8080
  source_security_group_id = local.backend_alb_sg_id
  security_group_id = local.catalogue_sg_id
}

# This is the mistake we did, cart can't access catalogue directly, it should be through backend ALB
/* resource "aws_security_group_rule" "catalogue_cart" {
  type              = "ingress"
  security_group_id = local.catalogue_sg_id
  source_security_group_id = local.cart_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
} */

### User ###

resource "aws_security_group_rule" "bastion_user" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.user_sg_id
}

resource "aws_security_group_rule" "backend_alb_user" {
  type              = "ingress"
  to_port           = 8080
  protocol          = "tcp"
  from_port         = 8080
  source_security_group_id = local.backend_alb_sg_id
  security_group_id = local.user_sg_id
}

### Cart ###

resource "aws_security_group_rule" "bastion_cart" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.cart_sg_id
}

resource "aws_security_group_rule" "backend_alb_cart" {
  type              = "ingress"
  to_port           = 8080
  protocol          = "tcp"
  from_port         = 8080
  source_security_group_id = local.backend_alb_sg_id
  security_group_id = local.cart_sg_id
}

### Shipping ### 

resource "aws_security_group_rule" "bastion_shipping" {
  type              = "ingress"
  security_group_id = local.shipping_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "backend_alb_shipping" {
  type              = "ingress"
  security_group_id = local.shipping_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}

##### Payment #####

resource "aws_security_group_rule" "bastion_payment" {
  type              = "ingress"
  security_group_id = local.payment_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "backend_alb_payment" {
  type              = "ingress"
  security_group_id = local.payment_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}

### Backend ALB ### 

resource "aws_security_group_rule" "backend_alb_bastion" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "backend_alb_frontend" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.frontend_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "cart_backend_alb" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.cart_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "shipping_backend_alb" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "payment_backend_alb" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.payment_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

##### Frontend #####

resource "aws_security_group_rule" "frontend_bastion" {
  type              = "ingress"
  security_group_id = local.frontend_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "frontend_frontend_alb" {
  type              = "ingress"
  security_group_id = local.frontend_sg_id
  source_security_group_id = local.frontend_alb_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

##### Frontend ALB  #####
resource "aws_security_group_rule" "frontend_alb_public" {
  type              = "ingress"
  security_group_id = local.frontend_alb_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}

### VPN ###

resource "aws_security_group_rule" "openvpn_public" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "openvpn_943" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 943
  protocol          = "tcp"
  to_port           = 943
}

resource "aws_security_group_rule" "openvpn_443" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}

resource "aws_security_group_rule" "openvpn_1194" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 1194
  protocol          = "tcp"
  to_port           = 1194
}

# resource "aws_security_group_rule" "catalogue_vpn" {
#   type              = "ingress"
#   security_group_id = local.catalogue_sg_id
#   source_security_group_id = local.open_vpn_sg_id
#   from_port         = 22
#   protocol          = "tcp"
#   to_port           = 22
# }

# resource "aws_security_group_rule" "catalogue_vpn_8080" {
#   type              = "ingress"
#   security_group_id = local.catalogue_sg_id
#   source_security_group_id = local.open_vpn_sg_id
#   from_port         = 8080
#   protocol          = "tcp"
#   to_port           = 8080
# }

resource "aws_security_group_rule" "components_vpn" {
  for_each = local.vpn_ingress_rules
  type              = "ingress"
  security_group_id = each.value.sg_id
  source_security_group_id = local.openvpn_sg_id
  from_port         = each.value.port
  protocol          = "tcp"
  to_port           = each.value.port
}
