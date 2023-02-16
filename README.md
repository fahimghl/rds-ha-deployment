# RDS Deployment for highly available e-commerce platform with below modules - teraform registry 

** VPC setup - changes can be made at root vairiables.tf **
default cidr    = "10.0.0.0/18"
vpc default = drupal
default regions = eu-west-1

** RDS setup - changes can be made at root vairiables.tf **

Default VPC / RDS subnet group enabled
CloudWatch metris
security groups 
IOps
multiAz


** Security groups setup - changes can be made at root vairiables.tf **
port 3305
allowed communication 10.0.0.0/18



** requirements **
AWS cli
terraform 
AWS account
aws profile configured for api calls


