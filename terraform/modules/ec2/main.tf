resource "aws_launch_configuration" "ec2_lc" {
  name          = "${var.env}-ec2_lc"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  user_data = <<EOF
#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sed -i 's/localhost:5044/${var.elk_ip}:5044/g' /etc/filebeat/filebeat.yml
service filebeat restart
EOF

  security_groups = [ aws_security_group.allow_traffic.id ]
}

resource "aws_autoscaling_group" "ec2_asg" {
  desired_capacity   = var.desired_capacity
  max_size           = var.max_capacity
  min_size           = var.min_capacity

  launch_configuration = aws_launch_configuration.ec2_lc.name
  vpc_zone_identifier       = var.subnet_ids

  tag {
    key                 = "Name"
    value               = "${var.env}-ec2-asg"
    propagate_at_launch = true
  }
}