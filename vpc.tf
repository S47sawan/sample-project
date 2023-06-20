#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# VPC Variables
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

variable "create_vpc" {
  description = "A flag to build a VPC or not. true or false"
  default     = {}
}
variable "enable_dns_hostnames" {
  description = "A flag to determine whether or not to enable VPC DNS host names"
  default     = {}
}
variable "enable_dns_support" {
  description = "A flag to determine whether or not to enable DNS support"
  default     = {}
}
variable "vpc_cidr" {
  description = "this the cidr range for the vpc"
  default     = {}
}
variable "vpc_name" {
  description = "This the name of the VPC deployed in the region"
  default     = {}

}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# VPC RESOURCE
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
resource "aws_vpc" "env-dev" {
  count                = var.create_vpc ? 1 : 0
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(local.common_tags,
    {
      "Name" = "${var.vpc_name}"
    }
  )
}