#!/bin/bash

# Exit on error
set -e

echo "Starting deployment setup..."

# 1. Install Docker and Docker Compose if not present
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh
    # Add current user to docker group
    usermod -aG docker $USER
    echo "Docker installed."
else
    echo "Docker is already installed."
fi

# 2. Setup Nginx
echo "Configuring Nginx..."
# Copy the config file to sites-available
cp nginx_zifra.conf /etc/nginx/sites-available/zifra
# Create symlink to sites-enabled
ln -sf /etc/nginx/sites-available/zifra /etc/nginx/sites-enabled/
# Test configuration
nginx -t
# Reload Nginx
nginx -s reload
echo "Nginx configured and reloaded."

# 3. Start Application
echo "Starting application with Docker Compose..."
# You might need to set these environment variables or create a .env file
export POSTGRES_PASSWORD="CHANGE_ME_SECURE_PASSWORD"
export REDIS_PASSWORD="CHANGE_ME_SECURE_PASSWORD"

docker compose -f docker-compose.prod.yaml up -d --build

echo "Deployment complete! Please ensure DNS records are propagated."
