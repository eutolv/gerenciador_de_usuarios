#!/bin/bash

#Script para criar grupo e adicionar usuários a ele

echo "Digite o nome do grupo que deseja criar: "
read grupo

#Verifica se o grupo já existe
if getent group "$grupo" > /dev/null; then
    echo "Grupo '$grupo' já existe."
    exit 1
fi

#Cria o grupo
sudo groupadd "$grupo"
echo "Grupo '$grupo' criado com sucesso."
#Pergunta se deseja adicionar usuários
echo "Deseja adicionar usuários ao grupo '$grupo'? (s/n)"
read resposta

if [[ "$resposta" == "s" || "$resposta" == "S" ]]; then
    echo "Digite o nome dos usuários separados por espaço: "
    read -a usuarios

    for usuario in "${usuarios[@]}"; do
        if id "$usuario" &>/dev/null; then
        sudo usermod -aG "$grupo" "$usuario"
            echo "Usuário '$usuario' adicionado ao grupo '$grupo'."
        else
            echo "Usuário '$usuario' não existe. Ignorado."
        fi
    done
fi