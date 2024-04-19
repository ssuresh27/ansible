module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  name = local.name
  cidr = var.vpc_cidr_block

  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  #For DB
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets                   = var.vpc_database_subnets

  # enable_nat_gateway = var.vpc_enable_nat_gateway
  # single_nat_gateway = var.vpc_single_nat_gateway # Avoids creating multiple NGW in all the private AZs
  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  #Auto assing public IP on launch for public EC2 instances
  map_public_ip_on_launch = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = local.common_tags


  vpc_tags = {
    Name = "${local.name}"
  }
}