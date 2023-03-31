// grant benchmark_instance read and write permissions to benchmarks_bucket
resource "aws_iam_role" "benchmark_instance" {
  name = "benchmark_instance"
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

resource "aws_iam_role_policy" "benchmark_instance" {
  name = "benchmark_instance"
  role = aws_iam_role.benchmark_instance.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::benchmarks-bucket",
        "arn:aws:s3:::benchmarks-bucket/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "benchmark_instance" {
  name = "benchmark_instance"
  role = aws_iam_role.benchmark_instance.id
}
