#!/bin/bash
sudo yum update
sudo yum install wget unzip -y
sudo wget -O splunk-8.0.3-a6754d8441bf-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.3&product=splunk&filename=splunk-8.0.3-a6754d8441bf-Linux-x86_64.tgz&wget=true' 
sudo tar xvzf splunk-8.0.3-a6754d8441bf-Linux-x86_64.tgz -C /opt
sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd password
sudo setenforce 0