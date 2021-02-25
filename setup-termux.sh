#!/data/data/com.termux/files/usr/bin/sh
termux-info

# Install packages
pkg upgrade
pkg install \
	x11-repo \
	proot

# Fix shebangs
pkg install termux-exec

# Enable Termux access to Android file storage
echo "Enabling access to storage...Please accept permission."
termux-setup-storage



# Enable Termux on boot
mkdir ~/.termux/boot
echo "Before proceeding,you must do the following:"
echo "1. Install the Termux:Boot app"
echo "2. Go into Android's settings and turn off battery optimizations for Termux & Termux:Boot"
echo "3. Launch the Termux:Boot application once."


# Enable Termux services on boot
pkg install termux-services
touch ~/.termux/boot/start-services
cat > ~/.termux/boot/start-services << EOF
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
. $PREFIX/etc/profile
EOF


# Configure shell
chmod +x ~/scripts/setup-shell.sh
~/scripts/setup-shell.sh

# Handle root access
root=$(termux-dialog confirm -t "Root Access" -i "Does your device have root access? If unsure, select 'no'")


echo "Done!"
