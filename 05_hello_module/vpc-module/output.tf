output "vp-main-id" {
  value = aws_vpc.main.id
}

output "subnet" {
  value = aws_subnet.public.id
}