data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vip_id" # Replace with the actual name of your SSM parameter
}
