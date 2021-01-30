# Data Source to get AMI ID
data "aws_ami" "server_elk" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["elk-base-ami*"]
  }

}

data "aws_ami" "server_ec2" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["ec2-filebeat-base*"]
  }

}

module "vpc" {
  // my network module
  source = "git@github.com:tonnytg/terraform-mod-network"

  cidr            = var.cidr
  cidr_blocks_pub = var.public_subnets
  cidr_blocks_pri = var.private_subnets
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
