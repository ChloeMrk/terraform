output "instance_ip" {
  value = aws_instance.hello.public_ip
  description = "Adresse IP publique de la VM"
}