resource "aws_default_subnet" "default" {
  availability_zone = var.availability_zone
  tags = {
    Name = "default"
  }
}