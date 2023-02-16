provider "aws" {
  region = var.region
}
locals {
  name   = "drupal-mysql"
  region = "eu-west-1"
  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-rds"
  }
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                         = var.name
  cidr                         = var.cidr_block
  azs                          = var.availability_zones
  create_database_subnet_group = true
}

module "mysql_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "${var.name}-demo-vpc"
  description = "Complete MySQL example security group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]
  tags = local.tags
}

module "mysqlDb" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.4"

  identifier             = "${var.identifier}-demo"
  engine                 = var.engine
  engine_version         = var.engine_version
  major_engine_version   = var.major_engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  monitoring_interval    = var.monitoring_interval
  family                 = var.family
  username               = var.username
  multi_az               = var.multi_az
  storage_encrypted      = var.storage_encrypted
  db_subnet_group_name   = module.vpc.database_subnet_group
  # vpc_security_group_ids = [module.mysql_security_group.security_group_id]

  blue_green_update = {
    enabled = true
  }
  create_monitoring_role = true
  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  tags = local.tags
  db_instance_tags = {
    "Sensitive" = "high"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }
}

# Future work 
module "elastic_beanstalk_application" {
  source = "cloudposse/elastic-beanstalk-application/aws"
}

module "elastic_beanstalk_environment" {
  
}
