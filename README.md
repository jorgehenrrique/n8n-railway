# 🚀 N8N no Railway

Deploy da plataforma de automação N8N no Railway com PostgreSQL.

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

#### ✅ Variáveis Obrigatórias

```bash
# Autenticação
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=SuaSenhaForte123

# Host e Protocolo
N8N_HOST=${{RAILWAY_STATIC_URL}}
N8N_PORT=5678
N8N_PROTOCOL=https
WEBHOOK_URL=https://${{RAILWAY_STATIC_URL}}/

# Database (conecta automaticamente)
DATABASE_URL=${{DATABASE_URL}}
DB_TYPE=postgresdb

# Timezone
GENERIC_TIMEZONE=America/Sao_Paulo
TZ=America/Sao_Paulo

# SSL/Segurança
N8N_SECURE_COOKIE=true
N8N_FORCE_SSL=true
```

#### 🔧 Variáveis Opcionais

```bash
# Performance
N8N_METRICS=true
N8N_DIAGNOSTICS_ENABLED=false
N8N_DEFAULT_BINARY_DATA_MODE=filesystem
N8N_BINARY_DATA_TTL=24
N8N_EXECUTE_IN_PROCESS=false

# Log
N8N_LOG_LEVEL=info
```

### 5. Deploy Automático

1. O Railway detectará automaticamente o `Dockerfile`
2. O build começará automaticamente
3. Aguarde 5-10 minutos para conclusão
4. Acesse via URL fornecida pelo Railway

## 🔗 Conectar Serviços

O Railway conecta automaticamente os serviços através da variável `${{DATABASE_URL}}`.

**Verificar conexão:**

1. Vá para o serviço PostgreSQL
2. Copie a `DATABASE_URL`
3. Verifique se está referenciada no serviço N8N

## 🛠️ Desenvolvimento Local

Para testar localmente:

```bash
# Clonar repositório
git clone https://github.com/seu-usuario/n8n-railway.git
cd n8n-railway

# Iniciar com Docker Compose
docker-compose up -d

# Acessar
http://localhost:5678
```

**Credenciais locais:**

- Usuário: `admin`
- Senha: `admin123`

## 🔍 Solução de Problemas

### ❌ "Database connection failed"

**Soluções:**

1. Verifique se o PostgreSQL foi adicionado ao projeto
2. Confirme que `DATABASE_URL=${{DATABASE_URL}}` está configurado
3. Aguarde 2-3 minutos após criar o banco

### ❌ "Service unavailable"

**Soluções:**

1. Verifique se todas as variáveis obrigatórias estão configuradas
2. Confirme que `N8N_HOST` usa `${{RAILWAY_STATIC_URL}}`
3. Verifique se o build foi concluído com sucesso

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

### Railway Pro Plan

- $20/mês + uso
- Recomendado para produção

---

## 🎉 Pronto!

Após seguir estes passos, seu N8N estará rodando no Railway com:

- ✅ PostgreSQL configurado
- ✅ HTTPS automático
- ✅ Webhooks funcionando
- ✅ Backup automático (Railway)
- ✅ Deploy automático via Git

**Acesse:** `https://seu-projeto.railway.app`

**Login:** Usuário e senha configurados nas variáveis de ambiente.
