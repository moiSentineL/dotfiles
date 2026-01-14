#!/bin/bash

DATE=$(date +"%Y-%m-%d")

# read -p "Enter short title for the win: " TITLE

TEMP_FILE="/tmp/win.md"

cat > "$TEMP_FILE" <<EOF
🏆 **TITLE** - $DATE

🔥 **Positives:**

+

👎 **Negatives:**

-


❔ **Uncategorised:**

?

EOF

emacsclient "$TEMP_FILE"

xclip -selection clipboard < "$TEMP_FILE"
rm "$TEMP_FILE"

echo "Win log copied."

