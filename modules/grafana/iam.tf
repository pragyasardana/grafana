resource "aws_iam_role" "grafana_bucket_access_role" {
  name = "grafana_bucket_access_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "grafana_bucket_access_profile" {
  name = "grafana_bucket_access_profile"
  role = aws_iam_role.grafana_bucket_access_role.name
}

resource "aws_iam_role_policy" "grafana_bucket_access_policy" {
  name = "grafana_bucket_access_policy"
  role = aws_iam_role.grafana_bucket_access_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
