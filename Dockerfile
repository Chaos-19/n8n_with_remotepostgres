# Base image from n8n
FROM n8nio/n8n:latest

# Install pm2 globally (to run multiple processes in one container)
USER root
RUN npm install -g pm2

# Create working directory for keep-alive server
WORKDIR /keepalive

# Copy package.json and install dependencies
COPY package.json package-lock.json* ./
RUN npm install --production

# Copy server file
COPY keepalive.js .

# Environment variables (DB creds will come from .env)
ENV N8N_PORT=5678 \
    N8N_HOST=0.0.0.0 \
    N8N_PROTOCOL=http

# Expose n8n and keepalive ports
EXPOSE 5678 3000

# Start both n8n and express using pm2
CMD pm2 start n8n --no-daemon -- \
    && pm2 start keepalive.js --no-daemon
