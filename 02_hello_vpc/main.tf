provider "aws" {
    region = "eu-west-3"
    access_key = "*"
    secret_key = "*"
}

resource "aws_vpc" "vpc-test" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet-test-1" {
    vpc_id = aws_vpc.vpc-test.id
    cidr_block = "10.0.1.0/24"

}