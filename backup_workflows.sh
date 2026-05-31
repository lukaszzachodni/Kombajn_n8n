#!/bin/bash

# Configuration
CONTAINER_NAME="n8n"
BACKUP_DIR="./n8n/workflows"
TEMP_CONTAINER_DIR="/home/node/backups"

echo "🚀 Starting n8n workflows export..."

# Create local backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# 1. Create temp directory in container
docker exec "$CONTAINER_NAME" mkdir -p "$TEMP_CONTAINER_DIR"

# 2. Export workflows
if docker exec "$CONTAINER_NAME" n8n export:workflow --all --backup --output="$TEMP_CONTAINER_DIR/"; then
    # 3. Copy files to host
    docker cp "$CONTAINER_NAME":"$TEMP_CONTAINER_DIR/." "$BACKUP_DIR/"
    echo "✅ Workflows exported to $BACKUP_DIR"
    
    # 4. Clean up container
    docker exec "$CONTAINER_NAME" rm -rf "$TEMP_CONTAINER_DIR"
    
    # 5. Git operations (optional - uncomment if you want auto-commit)
    # git add "$BACKUP_DIR"
    # git commit -m "Auto-backup n8n workflows: $(date +'%Y-%m-%d %H:%M:%S')"
    # echo "📦 Changes staged for Git"
else
    echo "❌ Error: Failed to export workflows"
    exit 1
fi
