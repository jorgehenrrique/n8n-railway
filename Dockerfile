FROM n8nio/n8n:latest

# Instalar dependências extras se necessário
USER root
RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    curl

USER node

# Configurar timezone
ENV TZ=America/Sao_Paulo

# Configurar n8n para production
ENV N8N_METRICS=true
ENV N8N_DIAGNOSTICS_ENABLED=false

# IMPORTANTE: Forçar carregamento de variáveis de ambiente
ENV N8N_CONFIG_FILES=""

# Expor porta
EXPOSE 5678

# Comando padrão - usar apenas "start" baseado nos templates funcionais
CMD ["start"]
