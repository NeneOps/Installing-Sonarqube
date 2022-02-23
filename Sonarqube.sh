#! /bin/bash

# Description: Installing Sonarqube
#Author: Odopey
#Date: Feb 2022

echo "Installing Java"
sleep 2

sudo yum update -y

sudo yum install java-11-openjdk-devel java-11-openjdk wget unzip ifconfig -y

cd /opt

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube-9.3.0.51899.zip

sudo unzip /opt/sonarqube-9.3.0.51899.zip

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
