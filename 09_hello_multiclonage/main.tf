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

resource "vultr_firewall_rule" "port_sql" {
    firewall_group_id = vultr_firewall_group.docker.id
    protocol = "tcp"
    ip_type = "v4"
    subnet = "0.0.0.0"
    subnet_size = 0
    port = "3306"
}

resource "vultr_startup_script" "my_script" {
    name = "echo_path"
    script = filebase64("script.sh")
}

resource "vultr_instance" "docker" {
  plan     = "vc2-1c-1gb"
  region   = "fra"          
  os_id    = 1743
  hostname = "Chloe-Merck-wp"
  label    = "chloe-wp"
  firewall_group_id = vultr_firewall_group.docker.id
  script_id = vultr_startup_script.my_script.id
  count = var.instance_count
  

}
