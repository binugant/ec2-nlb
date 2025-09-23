output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "nlb_dns_name" {
  value = module.nlb.dns_name
}
