#! /bin/bash
# Install on an ubuntu machine:
#  - docker
#  - awscli

mount_ebs() {
    # format and mount EBS volume
    DISK_NAME=$(lsblk -d -o NAME,SIZE | grep ${DISK_SIZE} | awk '{print $1}')
    sudo mkdir -p /data
    sudo mkfs -t xfs /dev/$DISK_NAME
    sudo mount /dev/$DISK_NAME /data
}

setup_docker() {
    # Install docker
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo usermod -aG docker ubuntu
    newgrp docker
    sudo service docker start
}

setup_awscli() {
    # Install awscli
    sudo apt-get install -y unzip
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
}

download_image() {
    # Pull docker image
    docker pull ltbringer/benchmark-rkv:latest
}

run_benchmarks() {
    # run docker image
    docker run -d --name rkv-bench \
        -v /data:/tmp \
        -e N_KEYS=$N_KEYS \
        -e S3_URI=$S3_URI \
        -e DAT_DIR=$DAT_DIR \
        ltbringer/benchmark-rkv:latest
}

main () {
    export N_KEYS=${N_KEYS}
    export S3_URI=${S3_URI}
    export DAT_DIR=${DAT_DIR}
    mount_ebs
    setup_docker
    setup_awscli
    download_image
    run_benchmarks
}

main