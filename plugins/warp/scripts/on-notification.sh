#!/bin/bash
# Hook script for Claude Code Notification event
# Sends a Warp notification when Claude needs user input

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Read hook input from stdin
INPUT=$(cat)

# Extract the notification message, removing system content entirely
MSG=$(echo "$INPUT" | jq -r '
  .message // "Input needed"
  | gsub("<local-command-caveat>[^<]*</local-command-caveat>"; "")
  | gsub("<system-reminder>[^<]*</system-reminder>"; "")
  | gsub("<command-name>[^<]*</command-name>"; "")
  | gsub("<[^>]*>"; "")
  | gsub("^\\s+"; "")
  | if length == 0 then "Input needed" else .[:200] end
' 2>/dev/null)
[ -z "$MSG" ] && MSG="Input needed"

"$SCRIPT_DIR/warp-notify.sh" "Claude Code" "$MSG"
