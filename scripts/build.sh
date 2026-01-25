#!/bin/bash

# Build script for JSON Editor Docker image

set -e

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Default image name and tag
IMAGE_NAME="${IMAGE_NAME:-jsoneditor}"
IMAGE_TAG="${IMAGE_TAG:-latest}"

echo "Building Docker image: ${IMAGE_NAME}:${IMAGE_TAG}"
echo "Project directory: ${PROJECT_DIR}"

# Build the Docker image
docker build -t "${IMAGE_NAME}:${IMAGE_TAG}" "${PROJECT_DIR}"

echo "Build completed successfully!"
echo "To run the container, use:"
echo "  docker run -d -p 8080:80 --name jsoneditor ${IMAGE_NAME}:${IMAGE_TAG}"
echo "Then open http://localhost:8080 in your browser"
