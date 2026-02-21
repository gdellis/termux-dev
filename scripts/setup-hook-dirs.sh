#!/data/data/com.termux/files/usr/bin/sh

# Termux Hook Setup Script - Phase 1
# Creates directory structure for hooks

echo "Creating Termux hook directories..."

# Create directories
mkdir -p ~/.termux/boot
mkdir -p ~/.termux/tasker
mkdir -p ~/.shortcuts
mkdir -p ~/.shortcuts/tasks
mkdir -p ~/.shortcuts/icons

# Set secure permissions (700 - owner only)
chmod 700 ~/.termux
chmod 700 ~/.termux/boot
chmod 700 ~/.termux/tasker
chmod 700 ~/.shortcuts
chmod 700 ~/.shortcuts/tasks
chmod 700 ~/.shortcuts/icons

echo "Created directories:"
echo "  ~/.termux/boot/     - Boot scripts (run at device startup)"
echo "  ~/.termux/tasker/   - Tasker scripts"
echo "  ~/.shortcuts/       - Widget shortcuts (foreground)"
echo "  ~/.shortcuts/tasks/ - Widget tasks (background)"
echo "  ~/.shortcuts/icons/ - Custom shortcut icons"
echo ""
echo "Phase 1 complete!"
