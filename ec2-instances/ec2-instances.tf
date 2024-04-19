module "ec2_bastion_instance" {
  for_each               = toset(["1", "2"])
  subnet_id              = element(module.vpc.public_subnets, tonumber(each.key))
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.6.0"
  name                   = "${var.environment}-${var.app-group}-bastion..${each.key}"
  ami                    = data.aws_ami.amazon_linux2.id
  instance_type          = var.inst_type
  key_name               = local.keypair_name
  vpc_security_group_ids = [module.public-bastion-ssh-sg.security_group_id]
  tags                   = local.common_tags

}