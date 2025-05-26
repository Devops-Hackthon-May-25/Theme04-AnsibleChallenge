output "controller_public_ip" {
  value = module.ec2.controller_public_ip
}

output "controller_private_ip" {
  value = module.ec2.controller_private_ip
}

output "web_server_public_ips" {
  value = module.ec2.web_server_public_ips
}

output "web_server_private_ips" {
  value = module.ec2.web_server_private_ips
}
output "vpc_id" {
  value = module.vpc.vpc_id
}