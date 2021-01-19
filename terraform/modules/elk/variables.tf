# Build Instance resource variables
variable "env" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
}

variable "key_pair_name" {
  type = string
  description = "Name of keypair"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.medium"

  # Need much RAM to ELK
  validation {
    condition = contains(["t2.medium", "t2.large", "t2.xlarge"], var.instance_type)
    
    error_message = "Enter valid EC2 Instance type of Family T2. ELK need 4G or greater than. Can you check this?"
  }
}

# Network and Security Variables
variable "vpc_id" {
  type = string
  description = "VPC in which instance will be launched"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnet ids"
}

variable "allowed_ingress" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

# Monitoring Variables
variable "sns_topic_list" {
  type = list(string)
  default = []
  description = "List of sns topics to send alarm notification"
}
