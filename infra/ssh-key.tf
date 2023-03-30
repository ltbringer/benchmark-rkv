resource "aws_key_pair" "rkv_benchmark_key" {
    key_name = "rkv_benchmark_key"
    public_key = file("~/.ssh/rkv-benchmark-key.pub")
}