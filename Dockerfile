# Start from official Node image (Render prefers full Node images)
FROM node:20-slim

# Install n8n globally
RUN npm install -g n8n

# Set working directory
WORKDIR /data

# Expose the port Render expects
ENV PORT=10000 \
    N8N_PORT=10000 \
    N8N_HOST=0.0.0.0 \
    N8N_PROTOCOL=http

EXPOSE 10000

# Start n8n
CMD ["n8n", "start"]
