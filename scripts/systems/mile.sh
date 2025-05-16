#!/bin/bash

# 📍 Configuration
REPO_DIR="$HOME/docs/war-hq/"  # change this path
EDITOR="nvim"                        # or code, nano, whatever you like

# 🕓 Get current date
DATE=$(date +"%Y-%m-%d")

# 📋 Get title
read -p "Enter short title for the milestone: " TITLE
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-')

# 📁 Make sure wins directory exists
mkdir -p "$REPO_DIR/milestones"

# 📝 Create file
FILENAME="$REPO_DIR/milestones/${DATE}-${SLUG}.md"

cat << EOF > "$FILENAME"
# [🎯] $TITLE

**Date:** $DATE  
**Status:** ✅ Achieved / 🛠️ In Progress / 🔜 Upcoming

---
### 🧭 Description

Write 2-5 lines about what the milestone is and why it matters. This should read like a plot point in a hero’s journey.

---

### 🚀 What Led to It

Quick breakdown of:
- Experiments you tried
- Wins that built up to this
- Changes in mindset or workflow

---

### 🧩 What Changed

- Tangible results (e.g. new repo, video, habits)
- Intangible stuff (e.g. confidence, clarity, energy)
- Any surprise benefits

---

### 🛣️ Next Steps

What comes *after* this? Mention next milestone, direction shift, etc.

EOF

# ✍️ Open it up for editing
$EDITOR "$FILENAME"

# 🧠 Git update
cd "$REPO_DIR"
git add "$FILENAME"
git commit -m "milestone: $TITLE on $DATE"
git push

