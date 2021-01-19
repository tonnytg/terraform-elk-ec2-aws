# Data Source to get AMI ID
data "aws_ami" "server_elk" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["elk-base-ami*"]
  }

}

data "aws_ami" "server_ec2" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["ec2-filebeat-base*"]
  }

}

# Modules
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
  }
}

module "elk_server" {
  source = "../modules/elk"

  env           = var.env
  key_pair_name = var.key_pair_name
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.public_subnets
  ami_id        = data.aws_ami.server_elk.image_id
  instance_type = var.elk_type
}

module "ec2_client" {
  source     = "../modules/ec2"
  depends_on = [module.elk_server]

  env           = var.env
  key_pair_name = var.key_pair_name
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.private_subnets
  ami_id        = data.aws_ami.server_ec2.image_id
  instance_type = var.ec2_type
  elk_ip        = module.elk_server.elk_ip

}