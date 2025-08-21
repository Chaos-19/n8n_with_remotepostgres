# Use official n8n image
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /data

# Copy package.json if you still need custom deps (optional)
# COPY package.json package-lock.json* ./
# RUN npm install --production

# Expose n8n port (Render maps it automatically)
ENV N8N_PORT=10000 \
    N8N_HOST=0.0.0.0 \
    N8N_PROTOCOL=http

EXPOSE 10000

# Start n8n
CMD ["n8n"]
