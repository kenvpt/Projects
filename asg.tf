
#AUTOSCALING GROUP

resource "aws_autoscaling_group" "my_asg" {
    name = "asg-${aws_launch_configuration.my_lc.id}"
    max_size = "${var.asg_max}"
    min_size = "${var.asg_min}"
    health_check_grace_period = "${var.asg_grace}"
    health_check_type = "${var.asg_hct}"
    desired_capacity = "${var.asg_cap}"
    force_delete = true
    load_balancers = ["${aws_elb.my_elb.id}"]

    vpc_zone_identifier = ["${aws_subnet.private_subnet.0.id}",
    "${aws_subnet.private_subnet.1.id}", "${aws_subnet.private_subnet.2.id}"]

    launch_configuration = "${aws_launch_configuration.my_lc.name}"
    tag {
        key = "Name"
        value = "my_asg-instance"
        propagate_at_launch = true
    }
    lifecycle {
        create_before_destroy = true
    }
}
