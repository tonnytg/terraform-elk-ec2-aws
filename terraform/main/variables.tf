variable "region" {
  description = "Region in which resources should be created"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "Environment name first Dev to test"
}

variable "key_pair_name" {
  type        = string
  description = "Name of existing keypair"
}

variable "ec2_type" {
  type        = string
  description = "EC2 type for client"
}

variable "elk_type" {
  type        = string
  description = "EC2 type for elk"
}

variable "azs" {
  type        = list
  description = "Available zones"
}

variable "cidr" {
  type        = string
  description = "Available zones"
}

variable "public_subnets" {
  type        = list
  description = "Public Subnet address"
}

variable "private_subnets" {
  type        = list
  description = "Private Subnet address"
}