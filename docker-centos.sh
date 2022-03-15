#!/bin/bash

# Author: Odopey
# Installing Docker into Centos 7 server
# Date: 5th March 2022

# Removing any old version of docker that might be installed
echo "Removing any old version of docker that might be installed "

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engin ec
sleep 3

echo "====================================================="
sleep 1

echo "Setting up the Docker Repository"
echo "====================================================="

sudo yum install -y yum-utils
 sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sleep 2

echo "Installing Docker"
echo "====================================================="
sudo yum install docker-ce docker-ce-cli contained.io -y
sleep 2
# Check status of docker 
sudo systemctl status docker
sleep 3
sudo systemctl enable docker
sudo systemctl start docker

echo "Checking that Docker installed correctly"
echo "====================================================="
 sudo docker run hello-world

