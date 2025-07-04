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

# Expor porta
EXPOSE 5678

# Comando padrão - baseado no template oficial Railway
CMD ["start"]
