#!/bin/sh

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker ubuntu
sudo systemctl start docker

sudo systemctl enable docker
sudo apt-get update -y
sudo apt-get install -y awscli
