variable "tags" {
  default =  {
      Environment = "prod"
      region = "useast1"
      managed = "terraform"
    }
}



variable "s3_configuration" {
  type = any
  description = "this is configuration for s3 in tfvars"
}