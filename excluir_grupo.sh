#!/bin/bash
# Script para excluir grupo do sistema

echo "Digite o nome do grupo que deseja excluir: "
read grupo

#Verifica se o grupo existe
if ! getent group "$grupo" > /dev/null; then
    echo "Grupo '$grupo' não existe."
    exit 1
fi

#Verifica se há usuários que pertencem a esse grupo
usuarios_no_grupo=$(getent group "$grupo" | cut -d: -f4)

if [[ -n "$usuarios_no_grupo" ]]; then
    echo "O grupo '$grupo' ainda possui membros: $usuarios_no_grupo"
    echo "Remova os usuários do grupo antes de excluí-lo, ou exclua mesmo assim? (s para excluir, qualquer outra tecla para cancelar)"
    read confirmar
    if [[ "$confirmar" != "s" && "$confirmar" != "S" ]]; then
        echo "Operação cancelada."
        exit 0
    fi
fi

#Confirmação final
echo "Tem certeza que deseja excluir o grupo '$grupo'? (s/n)"
read confirmacao

if [[ "$confirmacao" != "s" && "$confirmacao" != "S" ]]; then
    echo "Operação cancelada."
    exit 0
fi

#Executa a exclusão
sudo groupdel "$grupo"
echo "Grupo '$grupo' excluído com sucesso."