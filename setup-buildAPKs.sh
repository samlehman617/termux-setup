#!/bin/bash

echo "Installing BuildAPKs (tool for building Android apps)..."

# Install packages
pkg install aapt apksigner dx ecj git

# Download BuildAPKs repo
git clone https://github.com/sdrausty/buildAPKs

echo "Done!"
