resource "aws_security_group" "allow_traffic" {
  name        = "${var.env}-allow_ec2_traffic"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id

  # Inbound
  ingress {
    description = "SSH inbound"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-allow_ec2_traffic"
  }
}