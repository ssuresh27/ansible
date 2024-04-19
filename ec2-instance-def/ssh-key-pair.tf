# RSA key using TLS provider
resource "tls_private_key" "rsa-generated" {
  algorithm = "RSA"
  #   rsa_bits  = 4096
}


#Private key pair from above
resource "local_file" "private_key_name" {
content = tls_private_key.rsa-generated.private_key_pem
  # filename = "${path.module}/ec2-key.pem"
  filename = local.ssh-key-file
  file_permission = "0600"

}
#Pulbic key pair to import in EC2 instance

resource "aws_key_pair" "ssh-pub-key" {
  key_name   = "ansible_key"
  public_key = tls_private_key.rsa-generated.public_key_openssh
  lifecycle {
    ignore_changes = [key_name]
  }
}