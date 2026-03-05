# shell-plugin

Claude Code plugin for shell execution, hooks, and authorized recon workflows.

## Install

```bash
/plugin install https://github.com/offensi/marketplace
```

## Skills (auto-invoked by Claude)

| Skill | Triggers |
|---|---|
| `shell-executor` | "run", "execute", "launch", CLI tool invocations |
| `recon-runner` | "recon", "scan", "enumerate", nmap/nuclei/ffuf mentions |

## Slash commands

| Command | Description |
|---|---|
| `/shell-plugin:run <cmd>` | Run a shell command |
| `/shell-plugin:recon <target>` | Authorized recon against target |

## Hooks

| Event | Matcher | Script |
|---|---|---|
| PostToolUse | Write\|Edit | scripts/post-write.sh |
| PreToolUse | Bash | scripts/pre-bash.sh |
| Stop | — | scripts/on-stop.sh |
