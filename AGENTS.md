# AGENTS.md - Agent Guidelines for termux-dev

This file provides guidelines for agents operating in this repository.

## Repository Overview

This repository contains setup scripts and configurations for Termux automation, including:
- Boot hooks (`scripts/boot/`)
- Widget shortcuts (`scripts/widget/`)
- Tasker integration (`scripts/tasker/`)
- Terminal configurations (`scripts/terminal/`)
- Installation scripts (`scripts/*.sh`)

## Build/Lint/Test Commands

### Shell Script Validation

```bash
# Check shell script syntax (bash)
bash -n script.sh

# Check shell script syntax (sh/posix)
sh -n script.sh

# Lint all shell scripts with shellcheck (if installed)
shellcheck scripts/*.sh scripts/**/*.sh

# Run a single script in Termux
sh scripts/setup-hook-dirs.sh

# Make script executable and run
chmod +x script.sh && ./script.sh
```

### File Permissions

```bash
# Set correct permissions for hook scripts (700 - owner only)
chmod 700 ~/.termux ~/.termux/boot ~/.termux/tasker ~/.shortcuts ~/.shortcuts/tasks

# Make scripts executable
chmod +x scripts/boot/*.sh scripts/widget/* scripts/tasker/*
```

## Code Style Guidelines

### Shell Script Conventions

#### Shebang
- Use `#!/data/data/com.termux/files/usr/bin/sh` for maximum compatibility
- Use `#!/bin/bash` only if bash-specific features are required
- Avoid `/bin/sh` symlink issues by using full path

#### File Naming
- Hook scripts: `NN-name.sh` (numbered for boot order)
- Widget shortcuts: lowercase, no extension (e.g., `quick-update`)
- Tasker scripts: lowercase, descriptive
- Setup scripts: `setup-*.sh`

#### Permissions
- Directory hooks: `chmod 700`
- Executable scripts: `chmod +x`
- Sensitive configs: never `chmod 777`

### Error Handling

```sh
# Recommended header for all scripts
#!/data/data/com.termux/files/usr/bin/sh
set -euo pipefail

# Check command exists before running
if command -v termux-wake-lock >/dev/null 2>&1; then
    termux-wake-lock
fi

# Check file exists before sourcing
if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi
```

### Variables

```sh
# Use uppercase for constants, lowercase for variables
readonly SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
local backup_dir="$HOME/backups"

# Quote all variable expansions
cp "$file" "$destination"
```

### Functions

```sh
# Define functions before use
log_message() {
    local level="$1"
    shift
    echo "[$level] $*"
}
```

### Exit Codes

```sh
# 0 - Success, 1 - General error, 2 - Misuse
exit 0  # success
exit 1  # failure
```

### Paths

```sh
# Use Termux-specific paths
PREFIX="/data/data/com.termux/files/usr"
HOME="/data/data/com.termux/files/home"

# Check paths exist
if [ -d "$HOME/.termux" ]; then
    # ...
fi
```

### Output

```sh
# Use stderr for errors
echo "Error: file not found" >&2

# Progress messages to stdout
echo "Installing packages..."
```

## Code Organization

```
scripts/
├── boot/           # ~/.termux/boot/ scripts (numbered)
├── widget/         # ~/.shortcuts/ shortcuts
├── tasker/         # ~/.termux/tasker/ scripts
├── terminal/       # Config files (~/.bashrc)
├── setup-*.sh      # Installation/setup scripts
└── *.sh            # Utility scripts
```

### Script Header Template
```sh
#!/data/data/com.termux/files/usr/bin/sh
# Script Name - Purpose
# Usage: ./script.sh [options]
set -euo pipefail
# Main code here
```

## Security Considerations

- Never hardcode credentials or API keys
- Use `chmod 700` for sensitive directories
- Validate all user input
- Use `--` to separate options from arguments
- Avoid `eval` unless absolutely necessary

## Common Commands in Termux

```sh
# Package management
pkg update && pkg upgrade
pkg install <package>

# Permissions
termux-setup-storage
termux-wake-lock
termux-wake-unlock

# APIs (requires termux-api)
termux-clipboard-get
termux-clipboard-set
termux-notification
termux-sms-send
```

## Resources

- Termux Wiki: https://wiki.termux.com/wiki/
- ShellCheck: https://www.shellcheck.net/
- POSIX Shell: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
