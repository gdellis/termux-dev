# Termux Dev

## Setup Scripts

### Phase 1: Create Hook Directories
```sh
curl -sL https://raw.githubusercontent.com/USER/termux-dev/main/scripts/setup-hook-dirs.sh | sh
```

## Directory Structure

```
scripts/
├── boot/         # Scripts for ~/.termux/boot/
├── widget/       # Scripts for ~/.shortcuts/
├── tasker/       # Scripts for ~/.termux/tasker/
└── terminal/     # Terminal config (bashrc, aliases)
```

## References

- Termux Main Page: https://wiki.termux.com/wiki/Main_Page
- Differences from Standard Linux: https://wiki.termux.com/wiki/Differences_from_Linux
- PROOT: https://wiki.termux.com/wiki/Differences_from_Linux
- Intents & Hooks: https://wiki.termux.com/wiki/Intents_and_Hooks
- Package Managment: https://wiki.termux.com/wiki/Package_Management
- Remote Access: https://wiki.termux.com/wiki/Remote_Access
- Sharing Data: https://wiki.termux.com/wiki/Sharing_Data
- Proot-Distro: https://github.com/termux/proot-distro
- Termux Language Server: https://github.com/termux/termux-language-server
- Termux applications: https://github.com/termux/termux-app#installation

