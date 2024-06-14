#!/bin/bash
sudo apt-get update

if ! command -v git &> /dev/null
then
    echo "Git no está instalado. Instalando..."
    sudo apt-get install -y git
fi

if [ ! -d ~/Prestashop ]; then
    echo "Clonando repositorio Prestashop..."
    git clone https://github.com/Prodiegus/Prestashop.git ~/Prestashop
fi

if ! command -v docker &> /dev/null
then
    echo "Docker no está instalado. Instalando..."
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
    newgrp docker
fi

if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose no está instalado. Instalando..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

echo "Haciendo ejecutables los archivos en la carpeta scripts..."
sudo chmod +x ~/Prestashop/scripts/*

echo "Cambiando la propiedad de los directorios de los volúmenes..."
sudo chown -R $USER:$USER ~/Prestashop/data/prestashop
sudo chown -R $USER:$USER ~/Prestashop/data/prestashop_DB
sudo chmod 777 ~/Prestashop/data/prestashop
sudo chmod 777 ~/Prestashop/data/prestashop_DB

if ! docker network ls | grep -q 'prestashop_network'; then
    echo "Creando la red de Docker prestashop_network..."
    docker network create prestashop-net
fi

orig_dir=$(pwd)

echo "Iniciando contenedores de Docker..."
cd ~/Prestashop
sudo docker-compose up -d

echo "Programando la actualización de los contenedores..."
sudo (crontab -l ; echo "0 5 * * 1 ~/Prestashop/scripts/update_containers.sh") | crontab -

echo "Programando el respaldo de la base de datos..."
sudo (crontab -l ; echo "55 23 * * * ~/Prestashop/scripts/backup_db.sh") | crontab -

echo "Configuración completada."

cd $orig_dir
