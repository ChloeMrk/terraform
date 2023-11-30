output "instance_ip" {
  value = vultr_instance.docker[0].main_ip
  description = "Adresse IP publique de la VM"
}

