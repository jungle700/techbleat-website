variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

variable "path_to_public_key" {

  default = "./myreal.pub"


}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_key_name" {
  default = "myreal"
}

variable "amis" {
  type = map(string)
  default = {
    "eu-west-1" = "ami-06fd8a495a537da8b"
  }

}