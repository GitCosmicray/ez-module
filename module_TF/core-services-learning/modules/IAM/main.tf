resource "aws_iam_user" "Earth" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

resource "aws_iam_role" "s3_iam_role" {
  name = "s3_iam_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid = ""
        Principal = {
          Service = "s3.amazonaws.com"
        }
      },
    ]
  })
}




resource "aws_iam_policy" "s3-policy" {
  name = "s3-policy"
  #role   = "aws_iam_role.ec2_iam_role"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" = [{
      "Action"   = "s3:*",
      "Effect"   = "Allow",
      "Resource" = "*"
    }],
  })
}

resource "aws_iam_role_policy_attachment" "s3-role-attach" {
  role       = aws_iam_role.s3_iam_role.name
  policy_arn = aws_iam_policy.s3-policy.arn
}

