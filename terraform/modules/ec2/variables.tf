variable "region" {
  default     = "us-east-1"
  description = "Region in which resources should be created"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "desired_capacity" {
  type        = number
  default     = 1
  description = "Desired number of EC2 instances to be created"
}

variable "max_capacity" {
  type        = number
  default     = 1
  description = "Maximum number of EC2 instances to be created"
}

variable "key_pair_name" {
  type = string
  description = "Name of existing keypair"
}

variable "vpc_id" {
  type = string
  description = "VPC in which instance will be launched"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnet ids"
}

variable "min_capacity" {
  type        = number
  default     = 1
  description = "Minimum number of EC2 instances to be created"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance created by packer"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "allowed_ingress" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "elk_ip" {
  type = string
}

variable "sns_topic_list" {
  type = list(string)
  default = []
  description = "List of sns topics to send alarm notification"
}