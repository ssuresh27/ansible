module "public-bastion-ssh-sg" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.1.0"
  name        = "${var.environment}-${var.app-group}-bastion-sg"
  description = "Security group to allow port 22 to bastion host"
  vpc_id      = module.vpc.vpc_id
  # vpc_id    = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]

  egress_rules = ["all-all"]
  tags         = local.common_tags

}