#!/data/data/com.termux/files/usr/bin/sh

# Termux Complete Setup Script
# Run this to set up all hooks and automation

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

echo "=========================================="
echo "  Termux Complete Setup"
echo "=========================================="
echo ""

# Phase 1: Create directories
echo "[1/5] Creating hook directories..."
mkdir -p ~/.termux/boot
mkdir -p ~/.termux/tasker
mkdir -p ~/.shortcuts
mkdir -p ~/.shortcuts/tasks
chmod 700 ~/.termux ~/.termux/boot ~/.termux/tasker ~/.shortcuts ~/.shortcuts/tasks
echo "      Done!"

# Phase 2: Copy boot scripts
echo "[2/5] Setting up boot scripts..."
for script in "$REPO_DIR/scripts/boot"/*.sh; do
	if [ -f "$script" ]; then
		filename=$(basename "$script")
		cp "$script" ~/.termux/boot/
		chmod +x ~/.termux/boot/"$filename"
		echo "      Copied: $filename"
	fi
done

# Phase 3: Copy widget shortcuts
echo "[3/5] Setting up widget shortcuts..."
for script in "$REPO_DIR/scripts/widget"/*; do
	if [ -f "$script" ]; then
		filename=$(basename "$script")
		# Tasks go to tasks folder, shortcuts go to main shortcuts
		if [ "$filename" = "server-status" ]; then
			cp "$script" ~/.shortcuts/tasks/
			chmod +x ~/.shortcuts/tasks/"$filename"
			echo "      Copied to tasks: $filename"
		else
			cp "$script" ~/.shortcuts/
			chmod +x ~/.shortcuts/"$filename"
			echo "      Copied: $filename"
		fi
	fi
done

# Phase 4: Copy Tasker scripts
echo "[4/5] Setting up Tasker scripts..."
for script in "$REPO_DIR/scripts/tasker"/*.sh "$REPO_DIR/scripts/tasker"/!*.sh; do
	if [ -f "$script" ]; then
		filename=$(basename "$script")
		if [ "$filename" != "setup.sh" ]; then
			cp "$script" ~/.termux/tasker/
			chmod +x ~/.termux/tasker/"$filename"
			echo "      Copied: $filename"
		fi
	fi
done

# Phase 5: Install additional packages
echo "[5/5] Checking recommended packages..."
pkg install -y termux-services 2>/dev/null || true

echo ""
echo "=========================================="
echo "  Setup Complete!"
echo "=========================================="
echo ""
echo "Directories created:"
echo "  ~/.termux/boot/     - Boot scripts"
echo "  ~/.termux/tasker/   - Tasker scripts"
echo "  ~/.shortcuts/      - Widget shortcuts"
echo "  ~/.shortcuts/tasks/ - Background tasks"
echo ""
echo "Next steps:"
echo "1. Install plugins from F-Droid (see scripts/install-plugins.sh)"
echo "2. Add aliases: source ~/.termux/terminal/bashrc"
echo "3. Set up Tasker: ~/.termux/tasker/setup.sh"
echo ""
