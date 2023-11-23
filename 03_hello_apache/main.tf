provider "aws" {
    region = "eu-west-3"
    access_key = "*"
    secret_key = "*"
}

resource "aws_security_group" "allow_HTTP"{
    name = "allow_HTTP"
    vpc_id = "vpc-05339a29fee8bb83c"
    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "hello"{
    ami = "ami-00983e8a26e4c9bd9"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_HTTP.id]
    subnet_id = "subnet-0770b9c020023143f"
    user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2
              echo "Hello Terraform" | sudo tee /var/www/html/index.html
              EOF
}
                



