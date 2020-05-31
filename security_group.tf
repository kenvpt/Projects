resource "aws_security_group" "sg_http_https" {
    name = "sg_http_https"
    description = "http and https"
    vpc_id = "${aws_vpc.my_vpc.id}"
    tags = "${merge(aws_vpc.my_vpc.tags, map("Name", "http_https"))}"
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_security_group" "sg_ssh" {
    name = "sg_ssh"
    description = "ssh"
    vpc_id = "${aws_vpc.my_vpc.id}"
    tags = "${merge(aws_vpc.my_vpc.tags, map("Name", "ssh"))}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

#SECURITY GROUP for RDS
resource "aws_security_group" "sg_rds" {
    name = "wp_rds_sg"
    description = "Used for RDS instances"
    tags = "${merge(aws_vpc.my_vpc.tags, map("Name", "sg_rds"))}"
    vpc_id = "${aws_vpc.my_vpc.id}"


    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        # we use security_groups to attach this RDS security group to the public,dev instance, private security groups
        security_groups = ["${aws_security_group.sg_http_https.id}",
        "${aws_security_group.sg_ssh.id}", "${aws_security_group.sg_lb.id}"
        ]

    }

}

#SECURITY GROUP for private Ec2
resource "aws_security_group" "sg_private_ec2" {
    name = "wp_private_sg"
    description = "used for private instance"
    tags = "${merge(aws_vpc.my_vpc.tags, map("Name", "sg_private_ec2"))}"
    vpc_id = "${aws_vpc.my_vpc.id}"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # access from VPC
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

#SECURITY GROUP for load balancer

resource "aws_security_group" "sg_lb" {
    name = "wp_public_sg"
    description = "Used for the elastic load balancer for public access"
    tags = "${merge(aws_vpc.my_vpc.tags, map("Name", "sg_lb"))}"
    vpc_id = "${aws_vpc.my_vpc.id}"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
