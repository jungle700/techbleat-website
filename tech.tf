#.........................instance............................................

resource "aws_instance" "terra" {
  ami           = var.amis[var.aws_region]
  instance_type = var.instance_type
  key_name      = var.aws_key_name
  user_data     = data.template_file.myuserdata.template
  vpc_security_group_ids = ["${aws_security_group.ngi-group.id}"]
  subnet_id = "${aws_subnet.default.id}" 
  associate_public_ip_address = true


  tags = {
    Name = "Tech_Bleat"
  }
}


output "instance_ips" {
  value = aws_instance.terra.*.public_ip
}


data "template_file" "myuserdata" {
  template = file("${path.cwd}/temp.tpl")
}

#...................................key pair....................................................................

resource "aws_key_pair" "tkay" {

  key_name = "tkay"

  public_key = file(var.path_to_public_key)

}