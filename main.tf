provider "aws" {
  region = var.region
}

locals {
  userdata = templatefile(var.userdata ,  {
    ssm_cloudwatch_config = aws_ssm_parameter.cloudwatch_agent.name
  })
}

resource "aws_instance" "this" {
  ami                  = ""
  instance_type        = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.this.name
  user_data            = local.userdata
  tags                 = { Name = "EC2-with-cw-agent" }
}

resource "aws_ssm_parameter" "cloudwatch_agent" {
  description = "Cloudwatch agent config to configure custom log"
  name        = "/cloudwatch-agent/config"
  type        = "String"
  value       = file(var.cw)
}