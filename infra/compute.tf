resource "aws_instance" "benchmark_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.rkv_benchmark_key.id
  security_groups        = [aws_security_group.ssh_into_benchmark_instance.id]
  vpc_security_group_ids = [aws_security_group.ssh_into_benchmark_instance.id]
  subnet_id              = aws_default_subnet.default.id
  user_data_base64 = base64encode("${templatefile("${path.module}/scripts/install.sh", {
    N_KEYS  = var.n_keys
    S3_URI = "s3://${aws_s3_bucket.benchmarks_bucket.id}/rkv/reports/"
    DAT_DIR = var.data_dir
  })}")
  tags = {
    Name = "benchmark_rkv"
  }

  ebs_block_device {
    device_name           = "/dev/sdf"
    volume_size           = var.additional_volume_size
    volume_type           = var.volume_type
    delete_on_termination = var.delete_on_termination
  }

  iam_instance_profile = aws_iam_instance_profile.benchmark_instance.id
}

