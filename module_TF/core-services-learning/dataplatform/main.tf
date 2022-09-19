module "vpc" {
  source = "../modules/vpc/"
  vpc_configuration = var.vpc_configuration
  
}
 
module "ec2" {
  source = "../modules/ec2/"
  ec2_configuration = var.ec2_configuration
   s3_configuration = var.s3_configuration
}

module "IAM" {
  source = "../modules/IAM/"
  iam_configuration = var.iam_configuration
}

module "s3" {
  source = "../modules/s3/"
  s3_configuration = var.s3_configuration
}

terraform {
   backend "s3" {
    bucket = "us-east-2-bucket1"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
}

}