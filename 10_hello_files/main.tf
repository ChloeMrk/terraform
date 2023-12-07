provider "aws" {
    region = "eu-west-3"
    access_key = "*"
    secret_key = "*"
}




resource "aws_instance" "hello"{
    ami = "ami-00983e8a26e4c9bd9"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    key_name = "ec2"
}

resource "null_resource" "example" {
  triggers = {
    instance_id = aws_instance.hello.id
  }

provisioner "file" {
    source = "./app.py"
    destination ="/home/ubuntu/app.py"

    connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("./ec2.pem")
        host        = aws_instance.hello.public_ip
    }
}

provisioner "remote-exec" {
    inline = [
        "sudo apt update -y",
        "sudo apt-get install -y docker-ce docker-ce-cli containerd.io",
        "sudo systemctl start docker",
        "sudo docker run -d -p 80:5000 -v /home/ubuntu/app.py:/app.py python:3.9 python3 /app.py"

    ]

    connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("./ec2.pem")
        host        = aws_instance.hello.public_ip
    }
}

   
   
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow ssh"
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
    ipv6_cidr_blocks = ["::/0"]
  }
  
}




