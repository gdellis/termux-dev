#!/data/data/com.termux/files/usr/bin/sh

# Boot Hook: Wake Lock
# File: ~/.termux/boot/01-wakelock.sh
# Purpose: Prevent device from sleeping

termux-wake-lock
echo "Wake lock acquired"
