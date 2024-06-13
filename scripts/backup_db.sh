#!/bin/bash
sudo mkdir -p ~/respaldos
sudo docker exec db /usr/bin/mysqldump -u root --password=password prestashop > ~/respaldos/backup_$(date +%Y%m%d%H%M%S).sql