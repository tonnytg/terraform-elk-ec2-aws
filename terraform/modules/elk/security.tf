resource "aws_security_group" "allow_traffic" {
  name        = "${var.env}-allow_elk_traffic"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Kibana inbound"
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress
  }
  # inbound
  ingress {
    description = "logstash inbound"
    from_port   = 5044
    to_port     = 5044
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress
  }
  # outbound
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