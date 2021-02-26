#!/data/data/com.termux/files/usr/bin/sh

# Show device info
termux-info

# Install packages
pkg upgrade
pkg install \
	jq \
	x11-repo \
	proot

# Fix shebangs
pkg install termux-exec

# Enable Termux access to Android file storage
echo "Enabling access to storage...Please accept permission."
termux-setup-storage


# Enable Termux to run on boot
./setup-services.sh

# Configure shell
chmod +x ./setup-shell.sh
./setup-shell.sh

# Handle root access
root=$(termux-dialog confirm -t "Root Access" -i "Does your device have root access? If unsure, select 'No'")


echo "Done!"
echo "Please restart Termux for changes to take effect."
