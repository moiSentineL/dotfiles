#!/usr/bin/env bash
# Converts Obsidian-style todos to Discord markdown
# Finds today's daily note (format: "November 6, 2025.md")
# Usage: todo_export.sh [optional_path_to_daily_folder]

# Set default daily folder (edit this path if needed)
DAILY_DIR="/home/nibir/docs/obsidian/002 Journal/Daily/"

# Construct today's filename in "Monthname Day, Year.md" format
today_filename="$(date +"%Y/%m-%B/%B %-d, %Y").md"
today_path="$DAILY_DIR/$today_filename"

# Fallback for systems that pad day with zero (BSD/macOS vs GNU date difference)
if [ ! -f "$today_path" ]; then
  today_filename="$(date +"%B %e, %Y" | sed 's/ //1').md"
  today_path="$DAILY_DIR/$today_filename"
fi

# If file doesn't exist, warn and exit
if [ ! -f "$today_path" ]; then
  echo "❌ Could not find daily note: $today_filename in $DAILY_DIR"
  exit 1
fi

# Convert Obsidian-style markdown to Discord format

awk '
BEGIN { in_yaml=0 }
/^---$/ { in_yaml = !in_yaml; next }
in_yaml == 0 { print }
' "$today_path" | \
sed -E '
  s/^- \[x\]/✓/;
  s/^- \[ \]/☐/;
  s/^- \[-\] (.*)$/✗ ~~\1~~/;
  s/^- \[.\]/▨/;
  /Nibir'\''s To-Do/! s/^##+ (.*)$/**\1**/;
  s/[[:space:]]+$//;
  s/$/  /;
' | tee /tmp/today_discord.md | xclip -selection clipboard

echo "Log copied to clipboard"

