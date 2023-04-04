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
  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "aws_s3_bucket_public_access_block" "benchmarks_bucket" {
  bucket = aws_s3_bucket.benchmarks_bucket.id
  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_object" "benchmarks_bucket" {
  bucket = aws_s3_bucket.benchmarks_bucket.id
  key    = "projects/rkv/reports/"
  acl    = "public-read"
}
