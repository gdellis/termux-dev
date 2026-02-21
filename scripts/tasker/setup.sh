#!/data/data/com.termux/files/usr/bin/sh

# Tasker Integration Setup Script
# File: ~/.termux/tasker/setup.sh

echo "=========================================="
echo "  Termux:Tasker Setup Guide"
echo "=========================================="
echo ""

# Create tasker directory if it doesn't exist
mkdir -p ~/.termux/tasker
chmod 700 ~/.termux/tasker

# Check if allow-external-apps is enabled
PROPS_FILE="$HOME/.termux/termux.properties"

if [ -f "$PROPS_FILE" ]; then
	if grep -q "allow-external-apps=true" "$PROPS_FILE"; then
		echo "[OK] allow-external-apps is enabled"
	else
		echo "[WARN] allow-external-apps is NOT enabled"
		echo "  Add 'allow-external-apps=true' to $PROPS_FILE"
	fi
else
	echo "[INFO] No termux.properties found"
	echo "  Create it and add: allow-external-apps=true"
fi

echo ""
echo "Setup Steps:"
echo "1. Grant RUN_COMMAND permission to Tasker:"
echo "   Android Settings > Apps > Tasker > Permissions"
echo "   > Additional permissions > Run commands in Termux"
echo ""
echo "2. In Tasker, create a profile:"
echo "   - Event: [choose trigger]"
echo "   - Action: Plugin > Termux:Tasker"
echo ""
echo "3. Configure the action:"
echo "   - Executable: ~/.termux/tasker/SCRIPT_NAME"
echo "   - Arguments: [optional args]"
echo "   - Run in foreground: [toggle]"
echo ""
echo "Available Tasker scripts in ~/.termux/tasker/:"
ls -1 ~/.termux/tasker/ 2>/dev/null || echo "  (none yet)"
echo ""
