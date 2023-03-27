#VPC
resource "aws_vpc" "adastraec2-test" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "vpc-adatratsg-ghactions"
  }
}

#VPC Subnet
resource "aws_subnet" "adastraec2-test" {
  vpc_id = aws_vpc.adastraec2-test.id
  cidr_block = "172.16.0.0/24"

  tags = {
    "Name" = "subnet-adatratsg-ghactions"
  }
}

#VPC Network Interface
resource "aws_network_interface" "adastraec2-test" {
  subnet_id = aws_subnet.adastraec2-test.id

  tags = {
    "Name" = "NI-adatratsg-ghactions"
  }
}

#VPC Security Group
resource "aws_security_group" "adastraec2-test" {
  name = "adastra-tf-ghactions-sg"
  vpc_id = aws_vpc.adastraec2-test.id
  ingress {
    from_port= 8080
    to_port= 8080
    protocol= "tcp"
    cidr_blocks= ["0.0.0.0/0"]
  }
}

#AWS EC2
resource "aws_instance" "adastraec2-test" {
  ami= "ami-00ad2436e75246bba"
  instance_type= "t2.micro"

  network_interface {
    network_interface_id= aws_network_interface.adastraec2-test.id
    device_index= 0
  }

  tags = {
    "Name" = "adastra-tsg-ghaec2"
  }
}
