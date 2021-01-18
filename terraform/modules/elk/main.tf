resource "aws_instance" "elk_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id       = var.subnet_ids[0]
  key_name        = var.key_pair_name
  security_groups = [ aws_security_group.allow_traffic.id ]

  tags = {
    Name = "${var.env}-elk"
  }
}