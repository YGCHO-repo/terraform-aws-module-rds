# variable "account_id" {
#     description = "default account"
#     type        = number
# }

# variable "current_id" {
#     description = "AWS account that you 'd like to use"
#     type        = number
#     default     = 
# }


# variable "current_region" {
#     description = "region that using the RDS"
#     type        = string
#     #default    = "ap-northeast-2"
# }

variable "region" {
  description = "default region"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "prefix for the RDS resource"
  type        = string
}

variable "db_instance" {
  description = "the DB instance that you 'd like to set up"
  type        = map(any)
}

variable "db_param" {
  description = "the DB param that you'd like to set up"
  type        = map(any)
}

variable "db_sg" {
  description = "the DB security group that should be attached to"
  type        = map(any)
}

variable "vpc_filter" {
  description = "the VPC for RDS's SG"
  type        = map(any)
}

variable "tags" {
  description = "the tags for you"
  type        = map(any)
}
