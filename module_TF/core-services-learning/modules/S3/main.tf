

resource "aws_s3_bucket" "S3-UE1-bucket1" {

    bucket = "mystiqueaura-clone"
    acl = "private"
    force_destroy = "true"
    tags = lookup(var.s3_configuration, "tags")
    depends_on = [
      aws_s3_bucket.S3-UE1-dependsonbucket
    ]
}
output "bucket_id" {
    value = aws_s3_bucket.S3-UE1-bucket1.id
  
}

resource "aws_s3_bucket" "S3-UE1-dependsonbucket" {
    bucket = "vecna-buckcet122672"
    tags = lookup(var.s3_configuration, "tags")
    
}

