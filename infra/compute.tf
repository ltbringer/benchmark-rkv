resource "aws_instance" "example" {
  ami             = "ami-0c55b159cbfafe1f0"
  instance_type   = "t2.micro"
  key_name        = "example_key"
  security_groups = ["example_security_group"]
  tags = {
    Name = "benchmark_rkv"
  }

  ebs_block_device {
    device_name           = "/dev/sdf"
    volume_size           = var.additional_volume_size
    volume_type           = var.volume_type
    delete_on_termination = true
  }
}
