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
