#! /bin/bash
# Install on an ubuntu machine:
#  - docker
#  - awscli

# format and mount EBS volume
sudo mkfs -t ext4 /dev/sdf
sudo mkdir /data
sudo mount /dev/sdf /data

# Install docker
sudo apt-get update
sudo apt-get install -y docker.io
sudo usermod -aG docker ubuntu

# Install awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Start docker
sudo service docker start

# Pull docker image
sudo docker pull rkv-bench:latest

# run docker image 
sudo docker run -d --name rkv-bench -v /tmp:/tmp -e N_KEYS $N_KEYS -e S3_URI $S3_URI -e DAT_DIR $DAT_DIR