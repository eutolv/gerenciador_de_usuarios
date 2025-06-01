#!/bin/bash

while true; do
    clear #Limpa a tela
    echo "===== MENU PRINCIPAL ====="
    echo "1) Criar Usuário"
    echo "2) Modificar um usuário"
    echo "3) Excluir um usuário"
    echo "4) Criar grupo"
    echo "5) Modificar grupo"
    echo "6) Excluir grupo"
    echo "7) Automatizar permissões"
    echo "8) Automatizar permissões"
    echo "9) Sair"
    echo "=============================="
    echo -n "Escolha uma opção"
    read opcao

    case $opcao in
        1)
            ./criar_usuario.sh
            read -p "Pressione Enter para voltar ao menu..."
            ;;
         2)
            ./modificar_usuario.sh
            read -p "Pressione Enter para voltar ao menu..."
            ;;
        3)
            ./excluir_usuario.sh
            read -p "Pressione Enter para voltar ao menu..."
            ;;
        4)
            ./criar_grupo.sh
            read -p "Pressione Enter para voltar ao menu..."
            ;;
        5)
            ./modificar_grupo.sh
            read -p "Pressione Enter para voltar ao menu..."
            ;;
        6)
            ./excluir_grupo.sh
            read -p "Pressione Enter para voltar ao menu..."
            ;;
        7)
            ./permissoes.sh
            read -p "Pressione Enter para voltar ao menu..."
            ;;
        8)
            ./gerenciar_asl.sh
            read -p "Pressione Enter para voltar ao menu..."
            ;;

        9)
            echo "Saindo.."
            exit 
            ;;
        *)
            echo "Opção inválida! Tente novamente."
            read -p "Pressione Enter para continuar..."
            ;;
        esac
    done
