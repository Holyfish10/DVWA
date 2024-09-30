#!/bin/bash

# Check if docker-compose.yml exists in the current directory
if [ ! -f "compose.yml" ]; then
  echo "docker-compose.yml not found in the current directory. Please run this script in the directory containing docker-compose.yml."
  exit 1
fi

# Step 1: Bring down the Docker Compose services
echo "Bringing down Docker Compose services..."
sudo docker compose down

# Step 2: Remove the specified Docker volume 'dvwa_dvwa'
echo "Removing the Docker volume 'dvwa_dvwa'..."
sudo docker volume rm dvwa_dvwa

# Step 3: Bring up the Docker Compose services again with --force-recreate
echo "Bringing up Docker Compose services with --force-recreate..."
sudo docker compose up -d --force-recreate

echo "Done!"
