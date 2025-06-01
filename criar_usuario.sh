#!/bin/bash
#Criar usuário no Linux
while true; do
    echo "Digite o nome do usuário a ser criado: "
    read nome_usuario

    if [ -z "$nome_usuario" ]; then #-z significa string zero, ou string vazia
        echo "Nome vazio. Saindo..."
        exit 1
    fi

    #Criar usuário com diretório home
    sudo useradd -m "$nome_usuario"

    #Verificar se o comando deu certo
    if [ $? -eq 0 ]; then
        echo "Usuário '$nome_usuario' criado com sucesso!"
    else
        echo "Erro ao criar usuário."
    fi

    #Definir a senha para o usuário
    echo "Defina a senha para o usuário $nome_usuario:"
    sudo passwd "$nome_usuario"
    else 
        echo "Erro ao criar o usuário."
    fi

    #Perguntar se quer continuar ou voltar para o menu principal
    echo ""
    echo "Deseja criar outro usuário? (s/n)"
    read resposta
    if [[ "$resposta" != "s" && "$resposta" != "S" ]]; then
        echo "Voltando para o menu principal..."
        break
    fi
done