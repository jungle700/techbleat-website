resource "aws_subnet" "default" {

  vpc_id = aws_vpc.default.id

  cidr_block = "10.0.1.0/24"

  #map_public_ip_on_launch = true

}


# A security group for the nginx so it is accessible via the web

resource "aws_security_group" "ngi-group" {

  name = "nginx_connect"

  description = "nginx connection over the internet "

  vpc_id = aws_vpc.default.id

  #  Access via the internet

  ingress {

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

#....jenkins.................

 ingress {

    from_port = 8080

    to_port = 8080

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  # Access via SSH

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  # outbound internet access

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}