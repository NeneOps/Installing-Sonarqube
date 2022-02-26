#! /bin/bash

# Description: Installing Sonarqube
#Author: Odopey
#Date: Feb 2022

echo " "
sleep 2
if [ $UID != 0 ]
then
echo "you can now run this script"

else
echo "you must be a regular user"
exit 1
fi

echo " "
echo "System Update in Progress. This will take some minutes ..."
sudo yum update -y
sleep 3
echo " "

echo "Installing packages to help run Sonarqube sucessfully"
sudo yum install java-11-openjdk-devel java-11-openjdk wget unzip net-tools -y
sleep 3
echo " "

echo "Installing SONARQUBE now..."
echo " "

cd /opt

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

#Unzipping the sonarqube file
sudo unzip /opt/sonarqube-9.3.0.51899.zip

echo "********************************************* "
#Changing ownership of the sonarqube file in the /opt directory
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

# Change into the linux-x86-64 directory and run a script
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start

#Configuring your Sonarqube
# Lets configure the port 9000 on the firewall

sudo systemctl restart firewalld

sudo firewall-cmd --permanent --add-port=9000/tcp

sudo firewall-cmd --reload

echo "********************************************* "
echo "Enter $(ifconfig eth1|head -2|tail -1|awk '{print$2}'):9000 into your browser"
sleep 4

echo "********************************************* "
echo "Use login: admin and password: admin"
sleep 3
echo "********************************************* "

echo "Update your password to access the DASHBOARD"
echo " "

echo "END"