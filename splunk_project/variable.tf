variable "region"{}
variable "vpc_cidr"{}
variable "public_subnet_cidr"{
    type = "list"
}
variable "private_subnet_cidr"{
    type = "list"
}
variable "private_subnet_rds_cidr"{
    type = "list"
}
variable "instance_type"{}
variable "instance_type_asg"{}
variable "key_name"{}
variable "public_key_path"{}
variable "domain_name"{}
variable "delegation_set"{}
variable "tags"{
    type = "map"
}

variable "private_key_path"{}
variable "elb_healthy_threshold" {}

variable "elb_unhealthy_threshold" {}
variable "elb_timeout"{}
variable "elb_interval" {}
variable "asg_max" {}
variable "asg_min" {}
variable "asg_grace"{} 
variable "asg_hct" {}
variable "asg_cap" {}
variable "dbuser"{} 
variable "dbpassword"{} 
variable "db_instance_class"{}
variable "user_data" {}
variable "dbname"{}
