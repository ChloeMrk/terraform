#!/bin/bash
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# Créer un fichier YAML
cat <<-EOF > docker-compose.yml
version: '3'
services:
  database:
    container_name: mysql-container
    image: mysql:latest
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_DATABASE=mydb
      - MYSQL_USER=chloe
      - MYSQL_PASSWORD=root
  wordpress:
    image: wordpress:latest
    container_name: wordpress-container
    restart: on-failure
    ports:
      - 80:80
    environment:
      - WORDPRESS_DB_HOST=database
      - WORDPRESS_DB_USER=root
      - WORDPRESS_DB_PASSWORD=root
      - WORDPRESS_DB_NAME=wordpress
    depends_on:
      - database
    
EOF

# Le reste de votre script shell
echo "Fichier YAML créé."
sudo docker-compose up -d 

