#!/bin/bash
# Hook script for Claude Code Notification event
# Sends a Warp notification when Claude needs user input

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Read hook input from stdin
INPUT=$(cat)

# Extract the notification message and strip XML/system tags
MSG=$(echo "$INPUT" | jq -r '.message // "Input needed"' 2>/dev/null \
  | sed 's/<[^>]*>//g' | sed 's/^[[:space:]]*//' | head -c 200)
[ -z "$MSG" ] && MSG="Input needed"

"$SCRIPT_DIR/warp-notify.sh" "Claude Code" "$MSG"
