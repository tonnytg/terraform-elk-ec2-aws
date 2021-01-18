output "elk_ip" {
  value = aws_instance.elk_server.private_ip
}