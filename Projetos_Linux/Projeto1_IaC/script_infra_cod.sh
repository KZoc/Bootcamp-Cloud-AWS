#!/bin/bash

echo "Criando os diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Diretórios criados com sucesso!"

echo "---------------"
echo "Criando Grupos..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

chown root:root /publico/
chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec/

chmod 777 /publico/
chmod 770 /adm/
chmod 770 /ven/
chmod 770 /sec/

echo "Grupos Criados com Sucesso!"
echo "-------------------"
echo "Criando novos usuários..."

useradd carlos -c "Usuário Adm" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_ADM
useradd maria -c "Usuário Adm" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_ADM
useradd joao -c "Usuário Adm" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_ADM

useradd debora -c "Usuário Vendas" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_VEN
useradd sebastiana -c "Usuário Vendas" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_VEN
useradd roberto -c "Usuário Vendas" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_VEN

useradd josefina -c "Usuário Secretaria" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_SEC
useradd amanda -c "Usuário Secretaria" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_SEC
useradd rogerio -c "Usuário Secretaria" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_SEC

echo "Usuários criados com sucesso!!!"
echo "---- Processo Concluído ----"

