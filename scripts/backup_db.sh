#!/bin/bash
sudo mkdir -p ~/Prestashop/respaldos
sudo docker exec db /usr/bin/mysqldump -u root --password=password prestashop > ~/Prestashop/respaldos/backup_$(date +%Y%m%d%H%M%S).sql