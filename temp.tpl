#!/bin/bash

 yum install maven git -y
 wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
 rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
 yum install jenkins -y
 service jenkins start
 amazon-linux-extras enable nginx1.12
 yum install nginx -y
 service nginx start
