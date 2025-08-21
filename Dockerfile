FROM n8nio/n8n:latest

WORKDIR /data

ENV N8N_PORT=10000 \
    N8N_HOST=0.0.0.0 \
    N8N_PROTOCOL=http

EXPOSE 10000

CMD ["n8n", "start"]