#!/bin/bash
sudo yum install wget unzip -y
sudo wget -O splunkforwarder-7.3.2-c60db69f8e32-Linux-x86_64.tgz 'https://www.splunk.com/page/download_track?file=7.3.2/linux/splunkforwarder-7.3.2-c60db69f8e32-Linux-x86_64.tgz&ac=&wget=true&name=wget&platform=Linux&architecture=x86_64&version=7.3.2&product=universalforwarder&typed=release'
sudo tar xvzf splunkforwarder-7.3.2-c60db69f8e32-Linux-x86_64.tgz -C /opt
echo -e '[user_info]\n USERNAME = admin\n PASSWORD = password' > /opt/splunk/etc/system/local/user-seed.conf
sudo /opt/splunkforwarder/bin/splunk start --accept-license
sudo /opt/splunkforwarder/bin/splunk enable boot-start
sudo /opt/splunkforwarder/bin/splunk add forward-server 52.15.47.93:9997 --auth admin:password
sudo /opt/splunkforwarder/bin/splunk restart
sudo /opt/splunkforwarder/bin/splunk add monitor /var/log/messages -index main



