#!/bin/bash

# Script args
bootEnabled=${1:-true}
servicesEnabled=${2:-true}
vncOrX11=${3:-true}
desktop=${4:-"xfce4"}

# Constants
VNC_CFG_FILE="${XDG_CONFIG_DIR:-'~/."}/vnc/xstartup"
OPENBOX_CFG_FILE="${XDG_CONFIG_DIR:-$HOME/.config}/openbox/autostart"


setXClient() {
  # Export variable
  export DISPLAY="$1"
  # Write to shell config
  if [[ $SHELL === 'bash' ]]; then
    echo 'export DISPLAY=${DISPLAY:-":1"}' >> ~/.bashrc
  elif [[ $SHELL == 'zsh' ]]; then
    echo 'export DISPLAY=${DISPLAY:-":1"}' >> ~/.zshrc
  fi  
  # Create service
}

useVNC() {
  # Install tigervnc
  pkg install tigervnc
  # Start VNC server
  vncserver -localhost
}

useXServer() {

}

useDesktop {
  color=${2:-black}
  hashbang="\#!/data/data/com.termux/files/usr/bin/sh"
  
  # Make VNC config dir
  mkdir -p ~/.vnc
  
  # Add hashbang to VNC config
  echo $hashbang > $VNC_CFG_FILE
  
  if [[ $1 == "xfce4" ]]; then
    pkg install xfce4
    # Add xfce to VNC startup config
    echo "xfce4-session &" >> $VNC_CFG_FILE
  else if [[ $1 == "openbox" ]]; then
    # Install openbox
    pkg install openbox pypanel xorg-xsetroot

    # Add openbox to VNC startup config
    echo "openbox-session &" >> $VNC_CFG_FILE
    
    # Write Openbox startup config
    cat << EOF
      # Make background ${color}
      xsetroot -solid ${color}
      # Launch PyPanel
      pypanel &
    EOF > $OPENBOX_CFG_FILE
  else if [[ $1 == "fluxbox" ]]; then
    # Install fluxbox
    pkg install fluxbox
    cat << EOF
    fluxbox-generate_menu
    fluxbox &
    EOF >> $VNC_CFG_FILE
  else
  fi
}

# Install X repo
pkg install x11-repo





# Password prompt

askQuestions() {
  localResp=$(termux-dialog \
    -t "Display on phone?" \
    -i "Select 'Yes' to use your phone's display to view X11 applications. Press no to configure another display server" \
  )

  # TODO: Parse response json


  if [[local == true ]]; then
    useXServer ":1"
  else
    serverResp=$(termux-dialog \
      -t "X client IP address:port" \
      -i "Provide the IP address and port to use. (ie: IP_ADDR:PORT)" \
    )
    # TODO: Parse response json
  
    useServer $server
  fi
)
# Give instructions to view


exit 0;
