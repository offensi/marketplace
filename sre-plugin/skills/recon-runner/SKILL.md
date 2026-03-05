---
name: recon-runner
description: >
  Use this skill when the user wants to perform reconnaissance, scanning,
  or enumeration against an authorized target. Triggers include: "recon",
  "scan", "enumerate", "probe", "fingerprint", or mentions of tools like
  nmap, nuclei, ffuf, curl-based probing, or similar.
---

# Recon Runner Skill

This skill assists with authorized security reconnaissance workflows.

## Prerequisites

- User must confirm they have explicit authorization to test the target.
- Never proceed if authorization is unclear or absent.

## How to use this skill

1. **Confirm authorization** — ask the user to confirm they own or have written permission to test the target.
2. **Identify the target** — hostname, IP, URL, or CIDR range.
3. **Select tooling** — choose appropriate tools based on what's available and the target type.
4. **Run the recon script**:

```bash
${CLAUDE_PLUGIN_ROOT}/scripts/recon.sh <target>
```

Or invoke individual tools directly via the Bash tool.

5. **Parse and report findings**:
   - Group by category: open ports, services, technologies, potential vulnerabilities.
   - Flag high-interest findings for follow-up.
   - Suggest next steps (e.g. deeper enumeration, specific CVE checks).

## Common tool invocations

```bash
# Port scan
nmap -sV -T4 <target>

# HTTP probing
curl -sI https://<target>

# Directory enumeration
ffuf -u https://<target>/FUZZ -w /path/to/wordlist.txt

# Vulnerability scanning
nuclei -u https://<target> -severity medium,high,critical
```

## Output format

```
Target     : <target>
Auth check : confirmed
Findings   :
  [HIGH]   <finding>
  [MEDIUM] <finding>
  [INFO]   <finding>
Next steps : <recommendations>
```
