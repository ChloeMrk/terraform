output "instance_ip" {
  value = vultr_instance.docker.main_ip
  description = "Adresse IP publique de la VM"
}

output "instance_user" {
  description = "user login" 
  value = var.instance_user
}