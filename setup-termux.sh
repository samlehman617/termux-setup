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



# Enable Termux on boot
termux-dialog confirm \
  -t "Enable Termux on boot"
  -i \
"Before setup can continue, you must:
1. Install the Termux:Boot app.
2. Open Android's settings.
3. Turn off battery optimizations for Termux and Termux:Boot.
4. Launch the Termux:Boot application at least once.

Press 'Yes' when you have done so."

#echo "Before proceeding,you must do the following:"
#echo "1. Install the Termux:Boot app"
#echo "2. Go into Android's settings and turn off battery optimizations for Termux & Termux:Boot"
#echo "3. Launch the Termux:Boot application once."


# Enable Termux services on boot
mkdir -p ~/.termux/boot
pkg install termux-services
cat > ~/.termux/boot/start-services << EOF
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
. $PREFIX/etc/profile
EOF


# Configure shell
chmod +x ./setup-shell.sh
./setup-shell.sh

# Handle root access
root=$(termux-dialog confirm -t "Root Access" -i "Does your device have root access? If unsure, select 'No'")


echo "Done!"
echo "Please restart Termux for changes to take effect."
