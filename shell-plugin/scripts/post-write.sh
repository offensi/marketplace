#!/bin/bash
INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name // "unknown"')
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty')

echo "[post-write] tool=${TOOL} file=${FILE}" >&2

LOG="${CLAUDE_PLUGIN_ROOT}/scripts/activity.log"
echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ") WRITE tool=${TOOL} file=${FILE}" >> "$LOG"

exit 0
