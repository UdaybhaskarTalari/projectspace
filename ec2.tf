resource "aws_instance" "myFirstInstance" {
ami="ami-0efa651876de2a5ce"
count=1
key_name = "ubuntu-key"
instance_type = "t2.micro"
security_groups= [ "security_jenkins"]
tags={
Name = "diligentdragon"
}
}
resource "aws_security_group" "security_jenkins" {
name= "security_jenkins" 
description = "security group for jenkins"
ingress{
from_port= 8080
to_port = 8080
protocol= "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress{
from_port = 0
to_port= 65535
protocol = "tcp" 
cidr_blocks = ["0.0.0.0/0"]
}
tags={
Name = "security_jenkins_port"
}
}