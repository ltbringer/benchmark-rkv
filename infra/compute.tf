resource "aws_instance" "benchmark_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.rkv_benchmark_key.id
  security_groups = [aws_security_group.ssh_into_benchmark_instance.id]
  vpc_security_group_ids = [aws_security_group.ssh_into_benchmark_instance.id]
  subnet_id       = aws_default_subnet.default.id
  tags = {
    Name = "benchmark_rkv"
  }

  ebs_block_device {
    device_name           = "/dev/sdf"
    volume_size           = var.additional_volume_size
    volume_type           = var.volume_type
    delete_on_termination = var.delete_on_termination
  }
}
