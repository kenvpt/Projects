resource "aws_elb" "my_elb" {
    name = "my-elb"

    subnets = ["${aws_subnet.public_subnet.0.id}",
    "${aws_subnet.public_subnet.1.id}", "${aws_subnet.public_subnet.2.id}"

    ]
    security_groups = ["${aws_security_group.sg_lb.id}"]

    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
    health_check {
        healthy_threshold = "${var.elb_healthy_threshold}"
        unhealthy_threshold = "${var.elb_unhealthy_threshold}"
        timeout = "${var.elb_timeout}"
        target = "TCP:80"
        interval = "${var.elb_interval}"
    }
    cross_zone_load_balancing = true #to equally distribute the workload across different AZ
    idle_timeout = 400
    connection_draining = true
    connection_draining_timeout = 400

    tags = {
        Name = "my_${var.domain_name}-elb"

    }




}
