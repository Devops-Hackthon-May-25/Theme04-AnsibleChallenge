output "controller_public_ip" {
  value = aws_instance.controller.public_ip
}

output "controller_private_ip" {
  value = aws_instance.controller.private_ip
}

output "web_server_public_ips" {
  value = [for instance in aws_instance.web : instance.public_ip]
}

output "web_server_private_ips" {
  value = [for instance in aws_instance.web : instance.private_ip]
}
