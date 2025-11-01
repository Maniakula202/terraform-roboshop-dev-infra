output "vpc_id" {
    value = module.vpc.vpc_id
}

output "default_vpc_id" {
    value = module.vpc.default_vpc_id
}

output "public_subnet_ids" {
    value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
    value = module.vpc.public_subnet_ids
}

output "database_subnet_ids" {
    value = module.vpc.public_subnet_ids
}