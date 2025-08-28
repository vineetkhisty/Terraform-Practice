#Create a key pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
  public_key = file("terraform-ec2-key.pub")
}

#Create a security group
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Create a VPC
resource "aws_vpc" "ec2_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "ec2_vpc"
  }
}
#Create a subnet
resource "aws_subnet" "ec2_subnet" {
  vpc_id            = aws_vpc.ec2_vpc.id
  cidr_block       = "10.1.0.0/24"  
  availability_zone = "us-east-1a"
  tags = {  
    Name = "ec2_subnet"     
    
  }
}

#Create an internet gateway
resource "aws_internet_gateway" "ec2_igw" {
  vpc_id = aws_vpc.ec2_vpc.id
  tags = {
    Name = "ec2_igw"
  }
}
#Create a route table
resource "aws_route_table" "ec2_rt" {
  vpc_id = aws_vpc.ec2_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ec2_igw.id
  }
  tags = {
    Name = "ec2_rt"
  }

}
#Associate the route table with the subnet
resource "aws_route_table_association" "ec2_rta" {
  subnet_id      = aws_subnet.ec2_subnet.id
  route_table_id = aws_route_table.ec2_rt.id
}

#Create an EC2 instance
resource "aws_instance" "ec2_instance" {
  ami                         = "ami-0c02fb55956c7d316" #Amazon Linux 2 AMI (HVM), SSD Volume Type - us-east-1
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  subnet_id                   = aws_subnet.ec2_subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "ec2_instance"
  }
}
