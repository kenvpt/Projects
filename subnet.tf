#SUBNETS PUBLIC

resource "aws_subnet" "public_subnet" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    count = "${length(data.aws_availability_zones.availability_zone.names)}"
    cidr_block = "${element(var.public_subnet_cidr,count.index)}"
    map_public_ip_on_launch = true
    availability_zone = "${element(data.aws_availability_zones.availability_zone.names,count.index)}"
    tags = "${merge(aws_vpc.my_vpc.tags, map("Name", "public_subnet${count.index + 1}"))}"
    
}

#SUBNET PRIVATE
resource "aws_subnet" "private_subnet" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    count = "${length(data.aws_availability_zones.availability_zone.names)}"
    cidr_block = "${element(var.private_subnet_cidr,count.index)}"
    map_public_ip_on_launch = false
    availability_zone = "${element(data.aws_availability_zones.availability_zone.names,count.index)}"
    tags = "${merge(aws_vpc.my_vpc.tags, map("Name", "private_subnet${count.index + 1}"))}"
}

#SUBNET PRIVATE RDS
resource "aws_subnet" "private_subnet_rds" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    count = "${length(data.aws_availability_zones.availability_zone.names)}"
    cidr_block = "${element(var.private_subnet_rds_cidr,count.index)}"
    map_public_ip_on_launch = false
    availability_zone = "${element(data.aws_availability_zones.availability_zone.names,count.index)}"
    tags = "${merge(aws_vpc.my_vpc.tags, map("Name", "private_subnet${count.index + 1}"))}"
}


#RDS SUBNET
resource "aws_db_subnet_group" "my_rds_subnetgroup" {
    depends_on = [aws_subnet.private_subnet_rds]
    name = "my_rds_subnetgroup"

    subnet_ids = ["${aws_subnet.private_subnet_rds.0.id}",
        "${aws_subnet.private_subnet_rds.1.id}",
        "${aws_subnet.private_subnet_rds.2.id}"
        ]
    tags = {
        Name = "my_rds_subnetgroup"
    }
}
