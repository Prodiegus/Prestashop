#!/bin/bash
cd ~/Prestashop
docker-compose pull
docker-compose down
docker-compose up -d