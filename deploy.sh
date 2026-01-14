#!/bin/bash
# Deploy script: Sync code to server and run experiments

set -e

SERVER="mqia842@sc468099.uoa.auckland.ac.nz"
REMOTE_DIR="~/RaBitQ"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== RaBitQ Deployment Script ===${NC}"

# Sync code to server
echo -e "${BLUE}1. Syncing code to server...${NC}"
rsync -avz \
  --exclude='.git' \
  --exclude='*.o' \
  --exclude='bin/*' \
  --exclude='results/*' \
  --exclude='__pycache__' \
  --exclude='.DS_Store' \
  . "$SERVER:$REMOTE_DIR/"

echo -e "${GREEN}✓ Code synced${NC}"

# Optional: Run remote commands
if [ "$1" = "test" ]; then
  echo -e "${BLUE}2. Running tests on server...${NC}"
  ssh "$SERVER" "cd $REMOTE_DIR && bash script/index.sh && bash script/search.sh"
  echo -e "${GREEN}✓ Tests complete${NC}"
fi

if [ "$1" = "build" ]; then
  echo -e "${BLUE}2. Building on server...${NC}"
  ssh "$SERVER" "cd $REMOTE_DIR && bash script/index.sh"
  echo -e "${GREEN}✓ Build complete${NC}"
fi

if [ "$1" = "search" ]; then
  echo -e "${BLUE}2. Running search on server...${NC}"
  ssh "$SERVER" "cd $REMOTE_DIR && bash script/search.sh"
  echo -e "${GREEN}✓ Search complete${NC}"
fi

echo -e "${GREEN}Done!${NC}"
