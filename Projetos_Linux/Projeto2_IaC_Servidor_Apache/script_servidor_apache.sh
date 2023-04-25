#!/bin/bash

echo "Atualização do Servidor"

apt update -y
apt upgrade -y

echo "Servidor Atualizado!"

echo "-----------------------"

echo "Instalando Apache2..."

apt install apache2 -y

echo "Apache2 Instalado com Sucesso!"

echo "-----------------------"

echo "Baixando e Instalando Unzip..."

apt install unzip

echo "Unzip instalado com sucesso!"

echo "-----------------------"

echo "Baixando aplicação WEB do repositório..."

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Aplicação baixada. Copiando para diretório apache padrão..."

unzip main.zip
cd linux_site_dio_main/
cp -R * /var/www/html/

echo "Aplicação pronta!"
echo "------ Processos Finalizados ------"



