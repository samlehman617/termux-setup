#!/bin/bash

echo "Setting up Termux on boot..."

mkdir -p ~/.termux/boot

# Tell user to turn off battery optimizations
termux-dialog confirm \
  -t "Enable Termux on boot"
  -i \
"Before setup can continue, you must:
1. Install the Termux:Boot app.
2. Open Android's settings.
3. Turn off battery optimizations for Termux and Termux:Boot.
4. Launch the Termux:Boot application at least once.
Press 'Yes' when you have done so."


# Enable Termux services on boot
echo "Setting up Termux services..."
pkg install termux-services
cat > ~/.termux/boot/start-services << EOF
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
. $PREFIX/etc/profile
EOF

exit 0
