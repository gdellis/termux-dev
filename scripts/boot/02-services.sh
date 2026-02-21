#!/data/data/com.termux/files/usr/bin/sh

# Boot Hook: Services
# File: ~/.termux/boot/02-services.sh
# Purpose: Start termux-services

# Enable wake lock if not already enabled
termux-wake-lock

# Start enabled services (requires termux-services package)
if [ -f "$PREFIX/etc/profile.d/start-services.sh" ]; then
	source "$PREFIX/etc/profile.d/start-services.sh"
	echo "Services started"
else
	echo "termux-services not installed (optional)"
fi
