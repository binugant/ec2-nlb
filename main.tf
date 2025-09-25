provider "aws" {
  region = "us-west-2"
}

module "ec2" {
  source        = "./modules/ec2"
  instance_name = "my-ec2"
  instance_type = "t3.micro"
  vpc_id        = var.vpc_id
  subnet_id     = var.subnet_id
  key_name      = var.key_name
}

module "nlb" {
  source        = "./modules/nlb"
  name          = "my-nlb"
  vpc_id        = var.vpc_id
  subnet_ids    = var.subnet_ids
  target_ids    = [module.ec2.instance_id]
  listener_port = 22
  target_port   = 22
}


###########
module "nlb" {
  source = "./modules/nlb"

  nlb_name            = "web-nlb"
  internal            = false
  subnets             = var.public_subnets
  vpc_id              = var.vpc_id
  target_group_name   = "web-tg"
  target_group_port   = 80
  target_group_protocol = "TCP"
  listener_port       = 80
  listener_protocol   = "TCP"
}

resource "aws_autoscaling_group" "web_asg" {
  vpc_zone_identifier = var.private_subnets
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  # ✅ Attach to NLB Target Group from module
  target_group_arns = [module.nlb.target_group_arn]
}
