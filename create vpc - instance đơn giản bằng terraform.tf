provider "aws" {
  region = "us-east-1" # Thay đổi vùng theo nhu cầu
}

# Tạo VPC
resource "aws_vpc" "custom_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Custom-VPC"
  }
}

# Tạo Subnet
resource "aws_subnet" "custom_subnet" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true # Đảm bảo EC2 có IP public

  tags = {
    Name = "Custom-Subnet"
  }
}

# Tạo Internet Gateway
resource "aws_internet_gateway" "custom_igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "Custom-Internet-Gateway"
  }
}

# Tạo Route Table
resource "aws_route_table" "custom_route_table" {
  vpc_id = aws_vpc.custom_vpc.id

  # Route tới Internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_igw.id
  }

  tags = {
    Name = "Custom-Route-Table"
  }
}

# Gắn Route Table vào Subnet
resource "aws_route_table_association" "custom_route_table_assoc" {
  subnet_id      = aws_subnet.custom_subnet.id
  route_table_id = aws_route_table.custom_route_table.id
}

# Security Group
resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh_"
  vpc_id      = aws_vpc.custom_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Hạn chế IP nếu cần
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow-SSH"
  }
}

# EC2 Instance
resource "aws_instance" "ubuntu_ec2" {
  ami           = "ami-08c40ec9ead489470" # AMI Ubuntu 22.04 LTS tại us-east-1
  instance_type = "t2.micro"
  key_name      = "ky-pair"

  subnet_id              = aws_subnet.custom_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # Cài đặt Docker tự động
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apt-transport-https ca-certificates curl software-properties-common
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
              add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              apt-get update
              apt-get install -y docker-ce
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "Ubuntu-EC2-Docker"
  }
}
