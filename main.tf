#aws.tf 

provider "aws" {
  region = "us-east-2"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  token = var.token
}

resource "aws_instance" "example" {
  ami           = "ami-083ebc5a49573896a"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
  tags = {
    name = "devops-eip"
    terraform   = "true"
    environment = "dev"
    created_by  = "devops"
  }
}