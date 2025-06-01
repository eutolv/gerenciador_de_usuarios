#!/bin/bash
#Script para modificar grupos do sistema

echo "Digite o nome do grupo que deseja modificar: "
read grupo

#Verifica se o grupo existe
if ! getent group "$grupo" > /dev/null; then
  echo "Grupo '$grupo' não existe."
  exit 1
fi

echo "O que deseja modificar no grupo '$grupo'?"
echo "1) Renomear grupo"
echo "2) Alterar GID (nº identificador único de um grupo no Linux)"
echo "3) Adicionar usuários ao grupo"
echo "4) Remover usuários do grupo"
echo "5) Sair"
read opcao

case "$opcao" in
    1)
        echo "Digite o novo nome para o grupo:"
        read novo_nome
        if getent group "$novo_nome" > /dev/null; then
            echo "Grupo '$novo_nome' já existe"
            exit 1
        fi
        sudo groupmod -n "$novo_nome" "$grupo"
        echo "Grupo '$grupo' renomeado para 'novo_nome'."
        ;;
    2)

esac
