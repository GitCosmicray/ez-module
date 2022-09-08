module "vpc" {
  source = "../modules/vpc/"
  vpc_configuration = var.vpc_configuration
}
 

module "ec2" {
  source = "../modules/ec2/"
  ec2_configuration = var.ec2_configuration
}

module "IAM" {
  source = "../modules/IAM/"
}

module "s3" {
  source = "../modules/s3/"
  s3_configuration = var.s3_configuration
}