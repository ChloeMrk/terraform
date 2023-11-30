terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
    }
  }
}


provider "vultr" {
  api_key = "*"
}

# data "vultr_os" "ubuntu" {
#   filter {
#     name   = "name"
#     values = ["Ubuntu 22.04 x64"]
#   }
# }
# data "vultr_application" "docker" {
#   filter {
#     name   = "docker"
#     values = ["Docker"]
#   }
# }


resource "vultr_firewall_group" "docker" {
    description = "regle docker"
}

resource "vultr_firewall_rule" "port_80" {
    firewall_group_id = vultr_firewall_group.docker.id
    protocol = "tcp"
    ip_type = "v4"
    subnet = "0.0.0.0"
    subnet_size = 0
    port = "80"

}

resource "vultr_firewall_rule" "port_22" {
    firewall_group_id = vultr_firewall_group.docker.id
    protocol = "tcp"
    ip_type = "v4"
    subnet = "0.0.0.0"
    subnet_size = 0
    port = "22"
    notes = "docker"
}

resource "vultr_startup_script" "my_script" {
    name = "echo_path"
    script = filebase64("script.sh")
}

resource "vultr_instance" "docker" {
  plan     = "vc2-1c-1gb"
  region   = "fra"          
  os_id    = 1743
  hostname = "Chloe-Merck-Docker"
  label    = "chloe-docker"
  firewall_group_id = vultr_firewall_group.docker.id
  script_id = vultr_startup_script.my_script.id
}

