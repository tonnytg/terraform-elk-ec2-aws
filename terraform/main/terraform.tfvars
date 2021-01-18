env             = "dev"
key_pair_name   = "my-key-pair"                         # Choose an existing key pair

cidr            = "10.0.0.0/16"                         # Decide your CIDR block
azs             = ["us-east-1a", "us-east-1b"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

elk_ami_id      = "ami-08707dbbaf59360c7"               # Get AMI ID after run $packer build
elk_type        = "t2.medium"                           # 4G or greater than

ec2_ami_id      = "ami-0144a621f6197f9a2"               # Get AMI ID after run $packer build
ec2_type        = "t2.micro"                            # No hardware needed