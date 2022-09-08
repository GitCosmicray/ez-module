variable "tags" {
  default =  {
      Environment = "prod"
      region = "useast1"
      managed = "terraform"
    }
}

variable "instance_type_2" {
  type = string
  default = "t2.micro"
}


variable "s3_configuration" {
  type = any
  description = "this is configuration for s3 in tfvars"
}