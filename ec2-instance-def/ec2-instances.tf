resource "aws_instance" "web-instance" {
  ami = data.aws_ami.amazon_linux2.id
  instance_type = var.inst_type
  security_groups = [aws_security_group.sg-ssh.name]
  key_name        = local.keypair_name
  count           = 1
  tags = {
    "Name"        = "${var.region}-${random_pet.random_name[count.index].id}"
    "Instance_ID" = "${random_pet.random_name[count.index].id}.${count.index}"
  }

}