module "vpc" {
    source = "git::https://github.com/Maniakula202/terraform-aws-vpc-module.git?ref=main"

    project = var.project_name
    environment = var.environment
    vpc_cidr = var.vpc_cidr

    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr

    vpc_peering_required = true
}