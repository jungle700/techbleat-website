#!/bin/bash

sudo apt update
sudo apt install git -y
sudo apt install maven -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo service jenkins start
sudo apt install nginx -y
sudo service nginx start
sudo service jenkins restart