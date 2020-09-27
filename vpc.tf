#.................................vpc................................................

resource "aws_vpc" "default" {

  cidr_block = "10.0.0.0/16"

}

#.....................................internet_gateway...............................................

resource "aws_internet_gateway" "default" {

  vpc_id = aws_vpc.default.id

}

#...................................route_table.....................................................

resource "aws_route" "internet_access" {

  route_table_id = "${aws_vpc.default.main_route_table_id}"

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = "${aws_internet_gateway.default.id}"

}