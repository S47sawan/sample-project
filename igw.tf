# ===================================================================================================================
#  RESOURCE IGW
# ===================================================================================================================
# ===================================================================================================================
# VARIABLES
# ===================================================================================================================
variable "create_igw" {
  description = "This a flag to enable or disable the creation of igw within the dev env for the vpc resources to interact with the internet"
  default     = {}
}
variable "igw_name" {
  description = "Name of the internet gatweway attached to the dev sample vpc "
  default     = {}

}
# ----------------------------------------------------------------------------------------------------------------------
# Create Internet Gateway
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_internet_gateway" "env_igw" {
  count  = var.create_igw ? 1 : 0
  vpc_id = aws_vpc.env-dev[0].id

  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.igw_name}"
    },
  )
}