env           = "dev"
key_pair_name = "my-key-pair" # Choose an existing key pair

region = "us-east-1" # Region

cidr            = "10.0.0.0/16" # Decide your CIDR block
azs             = ["us-east-1a", "us-east-1b"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

elk_type = "t2.medium" # Choose family with 4G or greater than to ELK Server

ec2_type = "t2.micro" # No hardware needed to Low Server Ubuntu EC2
