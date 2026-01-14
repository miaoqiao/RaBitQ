#!/bin/bash
# Interactive SSH session to server with RaBitQ environment

SERVER="mqia842@sc468099.uoa.auckland.ac.nz"
REMOTE_DIR="~/RaBitQ"

echo "Connecting to $SERVER"
echo "Remote directory: $REMOTE_DIR"
echo ""
echo "Once connected, you can:"
echo "  - cd ~/RaBitQ && python data/rabitq.py   (run indexing)"
echo "  - cd ~/RaBitQ && bash script/index.sh    (build C++ index)"
echo "  - cd ~/RaBitQ && bash script/search.sh   (run search)"
echo "  - Type 'exit' to disconnect"
echo ""

ssh -t "$SERVER" "cd $REMOTE_DIR && bash"
