variable "additional_volume_size" {
  default = 1000 # in GB
}

variable "volume_type" {
  # Read about volume types here:
  # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html
  default = "gp3"
}

variable "instance_type" {
  default = "c6a.2xlarge"
}

variable "ami" {
  default = "ami-02eb7a4783e7e9317"
}

variable "delete_on_termination" {
  default = true
}

variable "availability_zone" {
  default = "ap-south-1a"
}

variable "n_keys" {
  default = 100000000
}

variable "data_dir" {
  default = "/data/tmp"
}