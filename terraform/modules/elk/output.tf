output "elk_ip" {
  value = aws_instance.elk_server.private_ip
}

output "elk_pub_ip" {
  value = aws_instance.elk_server.public_ip
}