# Teraform registry and RDS deployment for highly accessible e-commerce platform

** VPC setup - root variables can be changed.

default cidr = "10.0.0.0/18" in tf
EU-West-1 is the default region for the VPC in Drupal.

** RDS setup: Root variables can be changed.

tf **

Default Enabled VPC / RDS subnet group
groups for CloudWatch metris security
IOps\multiAz


** Security groups configured; modifications are possible at the root variables.


Port 3305 was open for communication (tf **). 10.0.0.0/18



** Conditions **
Amazon account with a terraform AWS profile set up for api calls


** Restrictions **
Only a few options are available for a rds deployment in AWs free tier.
There are few options for storage devices with IOPS and at-rest encryption. improving security and speed by using a different class of rds instance.


Make file
Use the interactive console to run Terraform commands.

screenshots from the deployment

dealing with sesitive info - do not use inline password while setting up rds using thi script

export TF_VAR_password="you db password"