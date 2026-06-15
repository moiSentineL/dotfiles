#!/usr/bin/env sh

# Target date and time (Set to June 7, 2026 at midnight)
TARGET_DATE="2026-07-02 00:00:00"

TARGET_SEC=$(date -d "$TARGET_DATE" +%s)
CURRENT_SEC=$(date +%s)

DIFF_SEC=$((TARGET_SEC - CURRENT_SEC))

if [ $DIFF_SEC -le 0 ]; then
    echo "🚨 D-Day!"
else
    # Calculate days and the remaining hours
    DAYS=$((DIFF_SEC / 86400))
    HOURS=$(( (DIFF_SEC % 86400) / 3600 ))

    echo "⏳ ${DAYS}d ${HOURS}h left"
fi
