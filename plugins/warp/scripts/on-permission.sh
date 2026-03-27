#!/bin/bash
# Hook script for Claude Code PermissionRequest event
# Sends a Warp notification when Claude needs permission approval

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Read hook input from stdin
INPUT=$(cat)

# Extract tool name
TOOL=$(echo "$INPUT" | jq -r '.tool_name // empty' 2>/dev/null)
MSG="${TOOL:+Permission needed: $TOOL}"
MSG="${MSG:-Permission needed}"

"$SCRIPT_DIR/warp-notify.sh" "Claude Code" "$MSG"
