#!/bin/bash
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

echo "[pre-bash] command=${CMD}" >&2

if echo "$CMD" | grep -qE 'rm\s+-rf\s+/|mkfs|dd if='; then
  echo "[pre-bash] BLOCKED: dangerous command detected" >&2
  exit 1
fi

exit 0
