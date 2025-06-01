#!/bin/bash
# Script para modificar um usuário do Linux

echo "Digita o usuário que deseja modificar:"
read usuario

if ! id "$usuario" &>/dev/null; then #o comando 'id' mostra as infos do usuário em questão
    echo "Usuário '$usuario' não existe. "
    exit 1
fi

echo "O que deseja modificar?"
echo "1) Shell padrão"
echo "2) Nome do usuário (login)"
echo "3) Modificar senha do usuário"
echo "4) Grupo principal"
echo "5) Adicionar a grupo secundário"
echo "6) Sair"
read opcao

case $opcao in
    1)
        echo "Digite o caminho completo do novo shell (ex: /bin/bash):"
        read novo_shell
        #verifica de o shell existe
        if [ ! -x "$novo_shell" ]; then
            echo "Shell '$novo_shell' não encontrado ou não executável."
            exit 1
        fi
        sudo usermod -s "$novo_shell" "$usuario"
        echo "Shell do usuário '$usuario' alterado para '$novo_shell'."
        ;;
    2)
        echo "Digite o novo nome do usuário: "
        read novo_nome
        #Verifica se o novo nome já existe
        if id "$novo_nome" &>/dev/null; then
            echo "Usuário '$novo_nome' já existe. Escolha outro nome."
            exit 1
        fi
        sudo usermod -l "$novo_nome" "$usuario"
        echo "Nome de usuário alterado de '$usuario' para '$novo_nome'."
        ;;
    3)
        echo "MOdificando senha do usuário '$usuario'."
        sudo passwd "$usuario"
        ;;
    4)
        echo "Digite o novo grupo principal: "
        read novo_grupo
        #Verifica se o grupo existe
        if ! getent group "$novo_grupo" > /dev/null; then
            echo "Grupo '$novo_grupo' não existe."
            exit 1
        fi
        sudo usermod -g "$novo_grupo" "$usuario"
        echo "Grupo principal do usuário '$usuario' alterado para '$novo_grupo'."
        ;;
    5) echo "Digite o(s) grupo(s) secundário(s) para adicionar (separados por vírgula, sem espaços):"
    read grupos_secundarios

    # Verifica se os grupos existem
    IFS=',' read -ra grupos <<< "$grupos_secundarios"
    for grupo in "${grupos[@]}"; do
      grupo_trimmed=$(echo "$grupo" | xargs) # remove espaços
      if ! getent group "$grupo_trimmed" > /dev/null; then
        echo "Grupo '$grupo_trimmed' não existe."
        exit 1
      fi
    done

    sudo usermod -aG "$grupos_secundarios" "$usuario"
    echo "Usuário '$usuario' adicionado aos grupos '$grupos_secundarios'."
    ;;
6)
    echo "Saindo.."
    ;;
*)
    echo "Opção inválida."
esac
    

