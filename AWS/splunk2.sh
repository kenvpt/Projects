#!/bin/bash
sudo yum install wget unzip -y
wget -O splunklight-7.2.3-06d57c595b80-Linux-x86_64.tgz 'https://www.splunk.com/page/download_track?file=7.2.3/linux/splunklight-7.2.3-06d57c595b80-Linux-x86_64.tgz&ac=&wget=true&name=wget&platform=Linux&architecture=x86_64&version=7.2.3&product=splunk_light&typed=release'
sudo tar xvzf splunk-8.0.3-a6754d8441bf-Linux-x86_64.tgz -C /opt
sudo echo -e '[user_info]\n USERNAME = admin\n PASSWORD = password' > /opt/splunk/etc/system/local/user-seed.conf
sudo /opt/splunk/bin/splunk start --accept-license
sudo /opt/splunk/bin/splunk enable boot-start
