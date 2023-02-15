module "mysqlDb" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.7"
}