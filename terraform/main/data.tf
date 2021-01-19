data "aws_ami" "server_elk" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["elk-base-ami*"]
  }

}

data "aws_ami" "server_ec2" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["ec2-filebeat-base*"]
  }

}
