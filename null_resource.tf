resource "null_resource" "gitlab" {
  provisioner "remote-exec" {

    connection {
    type = "ssh"
    user = "centos"
    private_key = "${file(var.private_key_path)}"
    host = "${aws_instance.my_instance.public_ip}"
  }
  
    inline = [
          "sudo yum update -y",
          "sudo yum install wget unzip -y",
          "sudo wget -O splunk-8.0.3-a6754d8441bf-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.3&product=splunk&filename=splunk-8.0.3-a6754d8441bf-Linux-x86_64.tgz&wget=true'",
          "sudo tar xvzf splunk-8.0.3-a6754d8441bf-Linux-x86_64.tgz -C /opt",
          "sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd password",
          "sudo setenforce 0"
        # "sudo yum install -y curl policycoreutils-python openssh-server",
        # "sudo systemctl enable sshd",
        # "sudo systemctl start sshd",
        # "sudo yum install firewalld -y",
        # "sudo systemctl enable firewalld",
        # "sudo systemctl start firewalld",
        # "sudo firewall-cmd --permanent --add-service=http",
        # "sudo firewall-cmd --permanent --add-service=https",
        # "sudo systemctl reload firewalld",
        # "sudo yum install postfix -y",
        # "sudo systemctl enable postfix",
        # "sudo systemctl start postfix",
        # "curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash",
        # "sudo EXTERNAL_URL='http://gitlab.localdomain' yum install -y gitlab-ce",
        # "sudo setenforce 0"
    ]
  }
}
