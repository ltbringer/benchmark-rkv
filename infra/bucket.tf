resource "aws_s3_bucket" "benchmarks_bucket" {
  bucket = "ltbringer"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name        = "Benchmark Bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_public_access_block" "benchmarks_bucket" {
  bucket = aws_s3_bucket.benchmarks_bucket.id
  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_object" "benchmarks_bucket" {
  bucket = aws_s3_bucket.benchmarks_bucket.id
  key = "${var.remote_report_dir}/"
  acl    = "public-read"
}
