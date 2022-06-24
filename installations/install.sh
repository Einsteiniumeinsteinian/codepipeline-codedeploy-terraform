#!/bin/bash
 yum update
 yum install -y ruby
 yum install -y wget
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
 ./install auto
 yum install -y python-pip
 pip install -y awscli
yum install -y java-1.8.0-openjdk

  # tomcat installation
  amazon-linux-extras install tomcat9
  systemctl start tomcat

# tomcat config