#!/usr/bin/env bash
set -e

APP_NAME="test-nextapp"
PORT="3000"

echo "🚀 Deploying $APP_NAME..."

# Save current image as previous (best-effort)
docker tag test-nextapp:latest test-nextapp:previous || true

# Stop and remove existing container (if any)
docker stop "$APP_NAME" || true
docker rm "$APP_NAME" || true

# Run the new container
docker run -d \
  --name "$APP_NAME" \
  -p "$PORT:$PORT" \
  test-nextapp:latest

echo "✅ New version started for $APP_NAME"