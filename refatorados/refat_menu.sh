#!/bin/bash

# Função que exibe o menu (sem interação)
mostrar_menu() {
  echo "===== MENU PRINCIPAL ====="
  echo "1) Criar Usuário"
  echo "2) Modificar um usuário"
  echo "3) Excluir um usuário"
  echo "4) Criar grupo"
  echo "5) Modificar grupo"
  echo "6) Excluir grupo"
  echo "7) Automatizar permissões"
  echo "8) Gerenciar ASL"
  echo "9) Sair"
  echo "=============================="
}

# Função que processa a opção e executa o script correspondente
processar_opcao() {
  local opcao=$1
  case $opcao in
    1)
      ./criar_usuario.sh
      ;;
    2)
      ./modificar_usuario.sh
      ;;
    3)
      ./excluir_usuario.sh
      ;;
    4)
      ./criar_grupo.sh
      ;;
    5)
      ./modificar_grupo.sh
      ;;
    6)
      ./excluir_grupo.sh
      ;;
    7)
      ./permissoes.sh
      ;;
    8)
      ./gerenciar_asl.sh
      ;;
    9)
      echo "Saindo.."
      exit 0
      ;;
    *)
      echo "Opção inválida! Tente novamente."
      ;;
  esac
}

# Parte interativa, só roda se for executado diretamente
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  while true; do
    clear
    mostrar_menu
    echo -n "Escolha uma opção: "
    read opcao

    processar_opcao "$opcao"
    echo
    read -p "Pressione Enter para continuar..."
  done
fi
