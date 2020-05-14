#!/bin/bash
sudo yum install wget unzip -y
sudo wget -O splunkforwarder-8.0.3-a6754d8441bf-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.3&product=universalforwarder&filename=splunkforwarder-8.0.3-a6754d8441bf-Linux-x86_64.tgz&wget=true'
sudo tar xvzf splunkforwarder-8.0.3-a6754d8441bf-Linux-x86_64.tgz -C /opt
sudo /opt/splunkforwarder/bin/splunk start --accept-license --no-prompt --admin-passwd changeme
sudo /opt/splunkforwarder/bin/splunk add forward-server 3.23.26.172:9997 -auth admin:changeme
sudo /opt/splunkforwarder/bin/splunk add monitor /var/log/messages
sudo /opt/splunkforwarder/bin/splunk enable boot-start
sudo /opt/splunkforwarder/bin/splunk restart
setenforce 0




