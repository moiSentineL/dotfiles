#!/bin/bash

DATE=$(date +"%Y-%m-%d")

TEMP_FILE="/tmp/todo.md"

cat > "$TEMP_FILE" <<EOF
## Nibir's To-Do's - $DATE

**Core**
1. 
2. 

**Misc**
1. 
2. 

EOF

nvim "$TEMP_FILE"

xclip -selection clipboard < "$TEMP_FILE"
rm "$TEMP_FILE"

echo "Todos copied."

