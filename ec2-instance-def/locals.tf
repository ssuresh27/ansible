locals {
  owners      = var.app-group
  environment = var.environment
  name        = "${var.app-group}-${var.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
    Terraform   = "True"
  }
  keypair_name     = aws_key_pair.ssh-pub-key.key_name

} 