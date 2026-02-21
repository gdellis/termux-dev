#!/data/data/com.termux/files/usr/bin/sh

# Boot Hook: Network Setup
# File: ~/.termux/boot/03-network.sh
# Purpose: Network configuration at boot

# Wait for network to be ready
sleep 5

# Sync time if needed
if command -v ntpdate >/dev/null 2>&1; then
	ntpdate -b pool.ntp.org 2>/dev/null || echo "Time sync skipped"
fi

# Optional: Start SSH if configured
if [ -f "$HOME/.ssh/sshd_started" ]; then
	if command -v sshd >/dev/null 2>&1; then
		sshd
		echo "SSH server started"
	fi
fi

echo "Network setup complete"
