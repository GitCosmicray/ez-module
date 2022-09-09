resource "aws_iam_user" "Earth" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

resource "aws_iam_role_policy" "ec2_policy" {
  name = "ec2_policy"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}


resource "aws_instance" "IAM-ec2" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  tags = {
    Name = "IAM_ec2TEST"
  }
}
