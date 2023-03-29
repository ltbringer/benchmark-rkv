resource "aws_security_group" "ssh_into_benchmark_instance" {
  name_prefix = "ssh-benchmark-instance"
  description = "Security group to ssh into the benchmark instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}