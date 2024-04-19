# # EC2 Public

output "ec2_public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = [for dns in module.ec2_bastion_instance : dns.public_dns]
}

locals {
  conns = join("\n", concat([for instance in module.ec2_bastion_instance : instance.public_dns]))
}

resource "null_resource" "web" {
  # ...

  provisioner "local-exec" {
    command = "echo $local.conns >> output/private_ips.txt"
  }
}

# output "ec2_bastion_id" {
#   description = "The ID of the instance"
#   value       = module.ec2_bastion_instance.id
# }


# output "ec2_bastion_dns" {
#   description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
#   value       = module.ec2_bastion_instance.public_dns
# }

# output "ec2_bastion_ip" {
#   description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
#   value       = module.ec2_bastion_instance.public_ip
# }

# output "ec2_bastion_az" {
#   description = "The availability zone of the created instance"
#   value       = module.ec2_bastion_instance.availability_zone
# }

# # EC2 Private
# output "ec2_private_id" {
#   description = "The ID of the instance"
#   value       = [for ec2id in module.ec2_private_instance : ec2id.id]
# }


# output "ec2_private_dns" {
#   description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
#   value       = [for dns in module.ec2_private_instance : dns.private_dns]
# }

# output "ec2_private_ip" {
#   description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
#   value       = [for ip in module.ec2_private_instance : ip.private_ip]
# }

# output "ec2_private_az" {
#   description = "The availability zone of the created instance"
#   value       = [for az in module.ec2_private_instance : az.availability_zone]
# }