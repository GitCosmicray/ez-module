

resource "aws_s3_bucket" "my-s3name" {

    bucket = "mystiqueaura-clone"
    acl = "private"
    force_destroy = "true"
    tags = lookup(var.s3_configuration, "tags")
}
output "bucket_id" {
    value = aws_s3_bucket.my-s3name.id
  
}

resource "aws_s3_bucket" "bucket" {
    bucket = "vecna-buckcet1222"
    tags = lookup(var.s3_configuration, "tags")
    depends_on = [
      aws_instance.depends-on-ec2
    ]
}
resource "aws_instance" "depends-on-ec2" {
  
  ami           = "ami-08d4ac5b634553e16"
  instance_type = lookup(var.s3_configuration, "instance_type_2")
  tags = {
    Name = "Bucket-instance"
  }
  count         = 1
}
