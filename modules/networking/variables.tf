variable "name" {
  type        = string
  description = "A name for this network."
  
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."

}

variable "availability_zones" {
  description = "The availability zones to create subnets in"
}