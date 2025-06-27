# 🚀 N8N no Railway

Deploy da plataforma de automação N8N no Railway com PostgreSQL.

## 🚀 **DEPLOY RÁPIDO - TEMPLATE PRONTO**

**Use o template oficial testado e funcional:**

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/BqsFX6?referralCode=gandalf)

### **⚡ Vantagens do Template:**

- ✅ **Configuração pré-definida** - Todas as variáveis já configuradas
- ✅ **PostgreSQL incluído** - Banco criado automaticamente
- ✅ **Deploy em 1 clique** - Sem configuração manual
- ✅ **Totalmente funcional** - Baseado na configuração testada

### **🔧 Após usar o template:**

1. **Gere uma nova encryption key** (não use a padrão!)
2. **Altere usuário/senha** do Basic Auth
3. **Acesse seu N8N** - Pronto para usar!

---

## 📖 **DEPLOY MANUAL (Opcional)**

Se preferir fazer deploy manual, siga as instruções abaixo:

## 📋 Pré-requisitos

- Conta no [Railway.app](https://railway.app)
- Conta no GitHub
- Repositório Git configurado

## 🏗️ Estrutura do Projeto

```
n8n-railway/
├── Dockerfile          # Container Docker
├── package.json        # Dependências Node.js
├── railway.json        # Configuração Railway
├── docker-compose.yml  # Para desenvolvimento local
├── .env.example         # Exemplo de variáveis de ambiente
├── .gitignore         # Arquivos ignorados
└── README.md          # Esta documentação
```

## ✅ **CONFIGURAÇÃO TESTADA E FUNCIONANDO**

**⚠️ Nota:** Se você usou o template Railway, essas configurações já estão aplicadas automaticamente!

Esta configuração foi **testada com sucesso** em produção e está 100% funcional:

### **🔑 Principais Descobertas:**

- ✅ **Usar variáveis individuais** do PostgreSQL (não DATABASE_URL)
- ✅ **N8N_ENCRYPTION_KEY é obrigatório** (senão credenciais se perdem)
- ✅ **N8N_RUNNERS_ENABLED=true** (remove warnings)

---

## 🚀 Deploy no Railway

### 1. Preparar Repositório GitHub

1. Crie um repositório público no GitHub
2. Clone este projeto ou faça upload dos arquivos
3. Faça commit e push para o GitHub

### 2. Conectar ao Railway

1. Acesse [Railway.app](https://railway.app)
2. Clique em "New Project"
3. Selecione "Deploy from GitHub repo"
4. Autorize o Railway a acessar seus repositórios
5. Selecione o repositório `n8n-railway`

### 3. Adicionar PostgreSQL

**IMPORTANTE:** Adicione o banco ANTES de configurar as variáveis!

1. No dashboard do projeto, clique em "New"
2. Selecione "Database" → "Add PostgreSQL"
3. Aguarde a criação do banco (1-2 minutos)

### 4. Configurar Variáveis de Ambiente

Na seção "Variables" do seu serviço N8N (`n8n-railway`), adicione:

#### ✅ **CONFIGURAÇÃO FUNCIONAL COMPROVADA**

**Copie e cole EXATAMENTE estas variáveis no Railway:**

```bash
# 🔐 AUTENTICAÇÃO BÁSICA (opcional)
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=seu_usuario
N8N_BASIC_AUTH_PASSWORD=sua_senha_forte

# 🔑 ENCRYPTION KEY (CRÍTICO - gere uma nova chave!)
N8N_ENCRYPTION_KEY=Do5HiQ8gc0DRGI1s6N4s/V1SbBY4GSIwQ+0cDFu433o=

# 🌐 HOST E PROTOCOLO
N8N_HOST=${{RAILWAY_PUBLIC_DOMAIN}}
N8N_PROTOCOL=https
WEBHOOK_URL=https://${{RAILWAY_PUBLIC_DOMAIN}}/

# 🗄️ DATABASE - VARIÁVEIS INDIVIDUAIS
DB_POSTGRESDB_DATABASE=${{Postgres.POSTGRES_DB}}
DB_POSTGRESDB_HOST=${{Postgres.PGHOST}}
DB_POSTGRESDB_PASSWORD=${{Postgres.POSTGRES_PASSWORD}}
DB_POSTGRESDB_PORT=${{Postgres.PGPORT}}
DB_POSTGRESDB_USER=${{Postgres.POSTGRES_USER}}
DB_TYPE=postgresdb

# 🌍 TIMEZONE
TZ=America/Sao_Paulo

# ⚡ TASK RUNNERS (remove warning dos logs)
N8N_RUNNERS_ENABLED=true

# 🔒 SSL E SEGURANÇA
N8N_SECURE_COOKIE=true
N8N_FORCE_SSL=true
```

### **🔒 Como Funciona a Autenticação:**

1. **N8N Users:** Tela de cadastro na interface (crie seu usuário admin)

#### 🔧 **Variáveis Opcionais (recomendadas)**

```bash
# 📊 MÉTRICAS E PERFORMANCE
N8N_METRICS=true
N8N_DIAGNOSTICS_ENABLED=false

# 🔧 PERMISSÕES (resolve aviso de permissão)
N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# 📝 LOGS
N8N_LOG_LEVEL=info
```

### **🔑 Como Gerar sua Encryption Key:**

**⚠️ IMPORTANTE:** Gere uma chave única (não use a do exemplo!):

```bash
# No terminal (Mac/Linux):
node -e "console.log(require('crypto').randomBytes(32).toString('base64'))"

# OU use:
openssl rand -base64 32
```

**💾 Guarde essa chave em local seguro** - sem ela suas credenciais ficam inacessíveis!

### 5. Gerar Domínio Público

**IMPORTANTE:** Para acessar seu N8N, você precisa gerar um domínio público:

1. No serviço N8N (`n8n-railway`), vá para a aba "Settings"
2. Clique em "Generate Domain"
3. Railway criará uma URL como: `https://n8n-railway-production-xxxx.up.railway.app`
4. Confirme a porta: 5678
5. **Copie essa URL** - você precisará dela!

### 6. Deploy Automático

1. O Railway detectará automaticamente o `Dockerfile`
2. O build começará automaticamente
3. Aguarde 5-10 minutos para conclusão
4. Acesse via URL gerada no passo anterior

### 7. **Primeiro Acesso (Configuração)**

1. **Acesse sua URL:** `https://seu-projeto.railway.app`
2. **Basic Auth:** Popup pedirá usuário/senha (das variáveis) (pode não aparecer)
3. **Cadastro N8N:** Tela para criar seu usuário admin
4. **Pronto!** N8N funcionando com PostgreSQL

### **✅ Status Final:**

- 🔐 **PostgreSQL:** Conectado e funcionando
- 🚀 **SSL/HTTPS:** Ativo e automático
- 🔄 **Webhooks:** Configurados e prontos
- 📊 **Backups:** Automáticos pelo Railway

## 🛠️ **Desenvolvimento Local (Mesma Configuração Railway)**

O `docker-compose.yml` usa **exatamente** a mesma estrutura do Railway:

```bash
# Clonar repositório
git clone https://github.com/seu-usuario/n8n-railway.git
cd n8n-railway

# Iniciar PostgreSQL + N8N
docker-compose up -d

# Ver logs (opcional)
docker-compose logs -f n8n

# Acessar desenvolvimento
http://localhost:5678
```

### **🔒 Credenciais Locais:**

- **Basic Auth:** `admin` / `admin123` (pode não aparecer)
- **N8N Admin:** Cadastre na primeira tela (depois do Basic Auth)

### **📊 Diferenças Local vs Railway:**

| Aspecto  | Local           | Railway                 |
| -------- | --------------- | ----------------------- |
| SSL      | HTTP            | HTTPS                   |
| Host     | localhost:5678  | seu-projeto.railway.app |
| Database | Container local | PostgreSQL Railway      |
| Backup   | Manual          | Automático              |

### **🛑 Parar Desenvolvimento:**

```bash
# Parar serviços
docker-compose down

# Parar + remover volumes (reset completo)
docker-compose down -v
```

## 🔍 Solução de Problemas

### ❌ **"Database connection failed" / "connect ECONNREFUSED ::1:5432"**

**SOLUÇÃO TESTADA E APROVADA:**

Use **APENAS variáveis individuais** do PostgreSQL:

```bash
# ✅ FUNCIONA (testado e aprovado)
DB_POSTGRESDB_DATABASE=${{Postgres.POSTGRES_DB}}
DB_POSTGRESDB_HOST=${{Postgres.PGHOST}}
DB_POSTGRESDB_PASSWORD=${{Postgres.POSTGRES_PASSWORD}}
DB_POSTGRESDB_PORT=${{Postgres.PGPORT}}
DB_POSTGRESDB_USER=${{Postgres.POSTGRES_USER}}
DB_TYPE=postgresdb

# ❌ NUNCA USE - Pode não funcionar no Railway
DATABASE_URL=${{Postgres.DATABASE_URL}}
```

**🔧 Checklist de Deploy:**

1. ✅ PostgreSQL adicionado ao projeto
2. ✅ Variáveis individuais configuradas exatamente como acima
3. ✅ `N8N_ENCRYPTION_KEY` definida (única, não a do exemplo)
4. ✅ `N8N_HOST=${{RAILWAY_PUBLIC_DOMAIN}}`
5. ✅ Domínio público gerado
6. ✅ Build concluído com sucesso

### ❌ "Permissions 0644 for n8n settings file are too wide"

**Este é apenas um aviso de segurança, não impede o funcionamento.**

**Solução (opcional):**

```bash
# Adicione esta variável para aplicar permissões automaticamente
N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
```

**Ou ignore o aviso:**

```bash
# Adicione esta variável para desabilitar o aviso
N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
```

### ❌ "Não consigo acessar o N8N - Sem link/domínio"

**Solução:**

1. Vá para o serviço N8N (`n8n-railway`) no Railway
2. Clique na aba "Settings"
3. Clique em "Generate Domain"
4. Aguarde a geração da URL pública
5. Acesse via URL gerada

### ❌ "Service unavailable"

**Soluções:**

1. Verifique se todas as variáveis obrigatórias estão configuradas
2. Confirme que `N8N_HOST` usa `${{RAILWAY_PUBLIC_DOMAIN}}`
3. Certifique-se de que gerou o domínio público (passo acima)
4. Verifique se o build foi concluído com sucesso

### ❌ "SSL/HTTPS errors"

**Solução:** Certifique-se de que estas variáveis estão configuradas:

```bash
N8N_PROTOCOL=https
N8N_SECURE_COOKIE=true
N8N_FORCE_SSL=true
```

## 📊 Monitoramento

### Logs do Railway

1. Acesse o dashboard do projeto
2. Clique no serviço N8N
3. Vá para a aba "Logs"

### Métricas

O Railway fornece métricas básicas de CPU, memória e tráfego.

## 🔒 Segurança

### Credenciais Seguras

- Use senhas fortes para `N8N_BASIC_AUTH_PASSWORD`
- Mantenha as variáveis de ambiente privadas
- Considere usar 2FA no Railway

### SSL/TLS

O Railway fornece HTTPS automaticamente com certificados SSL gratuitos.

## 💰 Custos

### Railway Starter Plan (Gratuito)

- $5 de crédito mensal
- Suficiente para testes e projetos pequenos

### Railway Hobby Plan

- $5/mês + uso
- Recomendado para projetos pequenos

### Railway Pro Plan

- $20/mês + uso
- Recomendado para produção

---

## 🎉 **PROJETO FINALIZADO E FUNCIONANDO!**

Após seguir esta documentação **testada e aprovada**, seu N8N estará 100% funcional no Railway:

### **✅ Recursos Funcionando:**

- 🔐 **PostgreSQL:** Conectado com variáveis individuais
- 🚀 **HTTPS/SSL:** Ativo e automático
- 🔄 **Webhooks:** Configurados e prontos
- 📊 **Backups:** Automáticos pelo Railway
- 🔐 **Autenticação:** N8N Users
- ⚡ **Task Runners:** Habilitados
- 🌍 **Timezone:** America/Sao_Paulo
- 📝 **Logs:** Detalhados e organizados

### **🔗 Acesso Final:**

- **URL:** `https://seu-projeto.railway.app`
- **Basic Auth:** Usuário/senha das variáveis (pode não aparecer)
- **N8N Admin:** Cadastre na primeira tela

### **💡 Próximos Passos:**

1. **Crie workflows** no N8N
2. **Configure webhooks** para automações
3. **Monitore via Railway** dashboard
4. **Faça backup** da encryption key

**🚀 Deploy concluído com sucesso!**

---

## 🎯 **RESUMO - DUAS OPÇÕES DE DEPLOY:**

### 🚀 **Opção 1: Template Railway (RECOMENDADO)**

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/BqsFX6?referralCode=gandalf)

**✅ Vantagens:**

- Deploy em 1 clique
- Configuração automática
- PostgreSQL incluído
- Pronto para usar

### 📖 **Opção 2: Deploy Manual**

- Controle total das configurações
- Entendimento completo do processo
- Customização avançada
- Aprendizado detalhado
