#!/bin/bash
# Script para automatizar permissões de arquivos e diretórios

echo "Digite o caminho do arquivo ou diretório:"
read caminho

# Verifica se existe
if [[ ! -e "$caminho" ]]; then
  echo "Caminho '$caminho' não existe."
  exit 1
fi

echo "Deseja aplicar permissões (chmod)? (s/n)"
read aplicar_chmod

if [[ "$aplicar_chmod" == "s" || "$aplicar_chmod" == "S" ]]; then
  echo "Digite as permissões no formato numérico (ex: 755, 644):"
  read perms
fi

echo "Deseja alterar o dono (chown)? (s/n)"
read aplicar_chown

if [[ "$aplicar_chown" == "s" || "$aplicar_chown" == "S" ]]; then
  echo "Digite o novo dono (usuário):"
  read novo_dono
  if ! id "$novo_dono" &>/dev/null; then
    echo "Usuário '$novo_dono' não existe."
    exit 1
  fi
fi

echo "Deseja alterar o grupo (chgrp)? (s/n)"
read aplicar_chgrp

if [[ "$aplicar_chgrp" == "s" || "$aplicar_chgrp" == "S" ]]; then
  echo "Digite o novo grupo:"
  read novo_grupo
  if ! getent group "$novo_grupo" &>/dev/null; then
    echo "Grupo '$novo_grupo' não existe."
    exit 1
  fi
fi

echo "Deseja aplicar recursivamente? (s/n)"
read recursivo

# Confirmação
echo ""
echo "Resumo do que será feito:"
[[ "$aplicar_chmod" == "s" || "$aplicar_chmod" == "S" ]] && echo "- chmod $perms"
[[ "$aplicar_chown" == "s" || "$aplicar_chown" == "S" ]] && echo "- chown $novo_dono"
[[ "$aplicar_chgrp" == "s" || "$aplicar_chgrp" == "S" ]] && echo "- chgrp $novo_grupo"
[[ "$recursivo" == "s" || "$recursivo" == "S" ]] && echo "(modo recursivo)"
echo "No alvo: $caminho"

echo "Confirmar execução? (s/n)"
read confirmar

if [[ "$confirmar" != "s" && "$confirmar" != "S" ]]; then
  echo "Operação cancelada."
  exit 0
fi

# Execução
[[ "$aplicar_chmod" == "s" || "$aplicar_chmod" == "S" ]] && {
  if [[ "$recursivo" == "s" || "$recursivo" == "S" ]]; then
    sudo chmod -R "$perms" "$caminho"
  else
    sudo chmod "$perms" "$caminho"
  fi
}

[[ "$aplicar_chown" == "s" || "$aplicar_chown" == "S" ]] && {
  if [[ "$recursivo" == "s" || "$recursivo" == "S" ]]; then
    sudo chown -R "$novo_dono" "$caminho"
  else
    sudo chown "$novo_dono" "$caminho"
  fi
}

[[ "$aplicar_chgrp" == "s" || "$aplicar_chgrp" == "S" ]] && {
  if [[ "$recursivo" == "s" || "$recursivo" == "S" ]]; then
    sudo chgrp -R "$novo_grupo" "$caminho"
  else
    sudo chgrp "$novo_grupo" "$caminho"
  fi
}

echo "Alterações aplicadas com sucesso!"
