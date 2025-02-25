#!/bin/bash

# Username Docker Hub
DOCKER_HUB_USERNAME="ariframadhan"

# Nama dan tag image
IMAGE_NAME="item-app"
IMAGE_TAG="v1"
IMAGE_FULL_NAME="$DOCKER_HUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"

# 1. Build Docker image dari Dockerfile
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG .

# 2. Melihat daftar image di lokal
echo "Listing local Docker images..."
docker images

# 3. Mengubah nama image agar sesuai dengan format Docker Hub
echo "Tagging image for Docker Hub..."
docker tag $IMAGE_NAME:$IMAGE_TAG $IMAGE_FULL_NAME

# 4. Login ke Docker Hub
echo "Logging into Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u $DOCKER_HUB_USERNAME --password-stdin

# 5. Mengunggah image ke Docker Hub
echo "Pushing image to Docker Hub..."
docker push $IMAGE_FULL_NAME

echo "Docker image successfully pushed to Docker Hub!"