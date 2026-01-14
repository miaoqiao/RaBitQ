#!/bin/bash
# Quick sync: Push local changes to server (without full rsync)

SERVER="mqia842@sc468099.uoa.auckland.ac.nz"
REMOTE_DIR="~/RaBitQ"

if [ -z "$1" ]; then
  echo "Usage: ./sync.sh <file_or_directory>"
  echo "Example: ./sync.sh data/rabitq.py"
  echo "         ./sync.sh src/"
  exit 1
fi

echo "Syncing $1 to server..."
rsync -avz "$1" "$SERVER:$REMOTE_DIR/$1"
echo "✓ Synced"
