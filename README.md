# 🧑‍💻 Gerenciador de Usuários e Grupos Linux (Bash Script)

> Automação simples e prática para gerenciar usuários, grupos e permissões no Linux via terminal. Ideal pra estudantes e admins que querem aprender scripting modular e testes unitários. 🚀

---

## 📋 Descrição

Esse projeto é um conjunto de scripts em **Bash** que juntos formam um gerenciador de usuários e grupos no Linux. Ele oferece um **menu interativo** com opções para criar, modificar e excluir usuários e grupos, além de automatizar permissões.

A ideia é facilitar a administração do sistema, incentivar boas práticas de modularização do código e permitir a implementação de testes unitários de forma simples.

---

## ⚙️ Funcionalidades do menu principal

* ➕ Criar usuário
* ✏️ Modificar usuário
* ❌ Excluir usuário
* ➕ Criar grupo
* ✏️ Modificar grupo
* ❌ Excluir grupo
* 🔐 Automatizar permissões
* ⚙️ Gerenciar ASL (Automação específica)
* 🚪 Sair do programa

---

## 🚀 Como usar

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/user-manager.git
   cd user-manager
   ```

2. Dê permissão de execução a todos os scripts:

   ```bash
   chmod +x *.sh
   ```

3. Execute o script principal com o menu:

   ```bash
   ./menu.sh
   ```

4. Escolha a opção desejada e siga as instruções na tela.

---

## 📚 Estrutura do projeto

```
user-manager/
├── menu.sh                 # Script principal com o menu interativo
├── criar_usuario.sh        # Script para criar usuários
├── modificar_usuario.sh    # Script para modificar usuários
├── excluir_usuario.sh      # Script para excluir usuários
├── criar_grupo.sh          # Script para criar grupos
├── modificar_grupo.sh      # Script para modificar grupos
├── excluir_grupo.sh        # Script para excluir grupos
├── permissoes.sh           # Script para automatizar permissões
├── gerenciar_asl.sh        # Script para gerenciar ASL (Automação específica)
├── tests/                  # Testes unitários e mocks (a implementar)
│   └── ...
├── README.md               # Esse arquivo
└── .gitignore              # Regras para ignorar arquivos no Git
```

---

## 💡 Dicas importantes

* 🚨 **Cuidado:** Esses scripts fazem alterações no sistema. Teste em ambiente controlado ou com mocks antes de rodar em produção.
* 🧪 Use testes unitários para garantir que a lógica está funcionando antes de alterar usuários e grupos reais.
* 🔧 Modularize seu código para facilitar manutenção e testes.
* 📖 Documente cada script e mantenha o menu sempre atualizado.

---

## 📞 Contato

Quer trocar ideia, sugerir melhoria ou reportar bugs? Fala comigo! 🤙


