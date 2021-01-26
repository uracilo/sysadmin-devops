#! /bin/bash

if [ ! -f /var/vagrant_provision-version1 ]; then
    # Instalar software necesario
    apt-get update
    apt-get install -y nginx mysql-server vim

    # Crear usuario administrativo
    echo "Creando usuario administrador..."
    adduser --quiet --disabled-password --shell /bin/bash --home /home/administrador \
    --gecos "Administrador" administrador

    # Setear password
    echo "administrador:password"|chpassword

    touch /var/vagrant_provision-version1
fi
if [ ! -f /var/vagrant_provision-version2 ]; then
    mkdir /home/prueba

    touch /var/vagrant_provision-version2
fi