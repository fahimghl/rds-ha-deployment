variable "name" {
  type        = string
  description = "A name for this network."
  default     = "drupal"

}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
  default     = "10.0.0.1/18"
}

variable "availability_zones" {
  description = "The availability zones to create subnets in"
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}
