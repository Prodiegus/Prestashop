#!/bin/bash
if [ -z "$(docker network ls --filter name=^prestashop_network$ --format={{.Name}})" ]
then
    echo "La red prestashop_network no existe. Creando..."
    docker network create prestashop_network
fi
