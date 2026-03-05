---
name: shell-executor
description: >
  Use this skill whenever the user wants to run, execute, or launch a shell
  command, script, or binary. Triggers include: "run this", "execute",
  "launch", "call this script", or any request to invoke a CLI tool.
---

# Shell Executor Skill

This skill handles safe execution of shell commands within the project context.

## How to use this skill

When the user asks to run a command:

1. **Confirm** the exact command with the user before running it.
2. **Check** for obviously destructive patterns (e.g. `rm -rf /`, `mkfs`, `dd if=`). If found, refuse and explain why.
3. **Execute** using the Bash tool.
4. **Report** stdout, stderr, and exit code in a structured format:

```
Command  : <the command>
Exit code: <0 or non-zero>
Stdout   : <output or "(empty)">
Stderr   : <errors or "(none)">
```

5. **Interpret** the result — explain what happened and suggest next steps if the command failed.

## Safety rules

- Never run commands that modify system files outside the project directory without explicit user confirmation.
- Always prefer dry-run or preview flags when available (e.g. `rsync --dry-run`, `terraform plan`).
- If the command requires elevated privileges, warn the user before proceeding.
