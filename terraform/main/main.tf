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
  ami_id        = var.elk_ami_id
  instance_type = var.elk_type
}

module "ec2_client" {
  source     = "../modules/ec2"
  depends_on = [module.elk_server]

  env           = var.env
  key_pair_name = var.key_pair_name
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.private_subnets
  ami_id        = var.ec2_ami_id
  instance_type = var.ec2_type
  elk_ip        = module.elk_server.elk_ip

}
