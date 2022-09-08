variable "cidr_block" {
  default ="10.0.0.0/16"
  sensitive = true
}

variable "vpcs" {
  default = {
    cosmic = "10.0.0.0/16",   
    qwerty = "10.1.0.0/16"
  }
  
}

variable "vpc_configuration" {
  type = any
  description = "this is configuration for vpc"
  
  }
