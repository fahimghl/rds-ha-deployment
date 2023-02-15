module "vpc" {
  source = "/modules/networking"

  name               = var.vpc_name
  cidr_block         = var.cidr_block
  availability_zones = var.availability_zones
}
module "mysqlDb" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.4"
}

