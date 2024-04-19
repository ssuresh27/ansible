# output "key-name" {

#     value = aws_key_pair.ssh-pub-key.id
  
# }

output "ssh-key-file" {
    value = local.ssh-key-file
}

# output "pkey_pem" {

#     value = tls_private_key.rsa-generated.private_key_pem
#     sensitive = true

  
# }