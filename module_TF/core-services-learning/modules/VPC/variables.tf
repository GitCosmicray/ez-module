variable "cidr_block" {
  default ="10.0.0.0/16"
  sensitive = true
}


variable "vpc_configuration" {
  type = any
  description = "this is configuration for vpc"
  
  }
