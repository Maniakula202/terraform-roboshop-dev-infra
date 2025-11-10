locals {
    public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
    frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
    frontend_alb_certificate_arn = data.aws_ssm_parameter.frontend_alb_certificate_arn.value
    common_name = "${var.environment}-${var.project_name}"
    common_tags = {
        Project = var.project_name
        Environment = var.environment
        Terraform = "true"
    }
}