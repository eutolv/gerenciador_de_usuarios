#!/bin/bash
# Script para gerenciar ACLs

echo "Digite o caminho do arquivo ou diretório:"
read caminho

if [[ ! -e "$caminho" ]]; then
  echo "Caminho inválido ou inexistente."
  exit 1
fi

echo ""
echo "Menu de ACLs para '$caminho'"
echo "1) Exibir ACLs atuais"
echo "2) Adicionar permissão para usuário"
echo "3) Adicionar permissão para grupo"
echo "4) Remover permissão de ACL"
echo "5) Resetar todas as ACLs"
echo "0) Voltar"
read -p "Escolha uma opção: " opcao

case "$opcao" in
  1)
    echo "ACLs atuais:"
    getfacl "$caminho"
    ;;
  2)
    echo "Digite o nome do usuário:"
    read usuario
    echo "Digite as permissões (r, w, x ou combinações como rwx):"
    read permissoes
    sudo setfacl -m u:"$usuario":"$permissoes" "$caminho"
    echo "Permissões ACL adicionadas para o usuário '$usuario'."
    ;;
  3)
    echo "Digite o nome do grupo:"
    read grupo
    echo "Digite as permissões (r, w, x ou combinações como rwx):"
    read permissoes
    sudo setfacl -m g:"$grupo":"$permissoes" "$caminho"
    echo "Permissões ACL adicionadas para o grupo '$grupo'."
    ;;
  4)
    echo "Remover ACL de (u:usuario ou g:grupo):"
    read entrada
    sudo setfacl -x "$entrada" "$caminho"
    echo "Permissão ACL removida de '$entrada'."
    ;;
  5)
    sudo setfacl -b "$caminho"
    echo "Todas as ACLs removidas de '$caminho'."
    ;;
  0)
    echo "Voltando..."
    ;;
  *)
    echo "Opção inválida."
    ;;
esac
