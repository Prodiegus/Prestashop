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
fi

if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose no está instalado. Instalando..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

echo "Haciendo ejecutables los archivos en la carpeta scripts..."
chmod +x ~/Prestashop/scripts/*

echo "Cambiando la propiedad de los directorios de los volúmenes..."
sudo chown -R $USER:$USER ~/Prestashop/data/prestashop
sudo chown -R $USER:$USER ~/Prestashop/data/prestashop_DB

# Iniciar los contenedores de Docker
echo "Iniciando contenedores de Docker..."
docker-compose up -d

# Programar la actualización de los contenedores para los lunes a las 05:00
echo "Programando la actualización de los contenedores..."
(crontab -l ; echo "0 5 * * 1 cd $(pwd) && docker-compose pull && docker-compose up -d") | crontab -

# Programar el respaldo de la base de datos para todos los días a las 23:55
echo "Programando el respaldo de la base de datos..."
(crontab -l ; echo "55 23 * * * docker exec prestashop_db_1 /usr/bin/mysqldump -u root --password=rootpassword database > $(pwd)/backup.sql") | crontab -