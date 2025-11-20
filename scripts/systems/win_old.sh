#!/bin/bash

# 📍 Configuration
REPO_DIR="$HOME/docs/war-hq/"  # change this path
EDITOR="nvim"                        # or code, nano, whatever you like

# 🕓 Get current date
DATE=$(date +"%Y-%m-%d")

# 📋 Get title
read -p "Enter short title for the win: " TITLE
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-')

# 📁 Make sure wins directory exists
mkdir -p "$REPO_DIR/hq/_wins"

TEMPLATE="$REPO_DIR/.templates/win_lite.md"

# 📝 Create file
FILENAME="$REPO_DIR/hq/_wins/${DATE}-${SLUG}.md"

sed -e "s/{{DATE}}/$DATE/" \
    -e "s/{{TITLE}}/$TITLE/" \
    "$TEMPLATE" > "$FILENAME"

# ✍️ Open it up for editing
$EDITOR "$FILENAME"

# 🧠 Git update
#cd "$REPO_DIR"
#git add "$FILENAME"
#git commit -m "win: $TITLE on $DATE"
#git push

xclip -selection clipboard < "$FILENAME"

echo "✅ Win log copied to clipboard. Paste it into Telegram!"
