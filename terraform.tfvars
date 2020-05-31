region = "us-east-2"
vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
]
private_subnet_cidr = [
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24"
]
private_subnet_rds_cidr = [
    "10.0.21.0/24",
    "10.0.22.0/24",
    "10.0.23.0/24"
]

instance_type = "t2.xlarge"
instance_type_asg = "t2.micro"
key_name = "my_key"
user_data = "/home/centos/Projects/module_gitlab/gitlab_project/httpd"
public_key_path = "~/.ssh/id_rsa.pub"
domain_name = "www.kenvpt.com"
delegation_set = "Z10047533N9ED5L3STY30"
tags = {
   Department = "IT"
   Team = "Infrastructure"
}
private_key_path = "~/.ssh/id_rsa"   
elb_healthy_threshold = "2"
elb_unhealthy_threshold = "2"
elb_timeout = "3"
elb_interval = "30"
asg_max = "3"
asg_min = "2"
asg_grace = "300"
asg_hct = "EC2"
asg_cap = "2"
dbuser = "dbuser"
dbpassword = "password"
db_instance_class = "db.t2.micro"
dbname = "sample_database"
