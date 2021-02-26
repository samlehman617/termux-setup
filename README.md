<a href="https://termux.com">
<img src="https://f-droid.org/repo/com.termux/en-US/icon_7jMZ7XD80oeucmGEaTwktIRZexLtGWvJfKdVD6Wu2SI=.png" alt="Termux icon" width="100px"/>
</a>

# termux-setup

Scripts to setup the Android terminal emulator [Termux](https://termux.com)

This repository contains a handful of scripts I originally created to configure Termux the way I like it. 
I have genericized them and added user instructions as well as UI input methods to allow the user to configure some aspects of the install process.

## What it does:
- Installs popular shell programs (zsh, neovim, curl, etc.)
- Downloads dotfiles from a git repository
- Configures running Termux scripts & services at boot
- Installs x11-repo && configures an X11 server environment
- Enables sshd
- Enables SFTP
- Enables using Android's file storage

## Get Termux
You will need to have downloaded and installed the Termux application before proceeding. 

You can find it on [F-Droid](https://f-droid.org) or the [Google Play Store](https://play.google.com/store/apps).
I recommend F-Droid. [Download the F-Droid app here](https://f-droid.org/F-Droid.apk)


<a href="https://f-droid.org/packages/com.termux/">
<img src="https://termux.com/files/fdroid.png" alt="get it on F-Droid!" width=25%>
</a>
<a href="https://play.google.com/store/apps/details?id=com.termux">
<img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" alt="get it on Google Play!" width=25%>
</a>


I also have installed all the addons:
- [Termux:API](https://f-droid.org/en/packages/com.termux.api)
- [Termux:Boot](https://f-droid.org/en/packages/com.termux.boot)
- [Termux:Float](https://f-droid.org/en/packages/com.termux.window)
- [Termux:Styling](https://f-droid.org/en/packages/com.termux.styling)
- [Termux:Tasker](https://f-droid.org/en/packages/com.termux.tasker)
- [Termux:Widget](https://f-droid.org/en/packages/com.termux.widget)

The addons are not required, but some optional configuration features do depend on Termux:API, Termux:Boot, and Termux:Widget. 
They are free on F-Droid, but cost $1.99 on the Google Play Store.


## Setup
- Install the Termux app and any addons.
- If you installed the Termux:Boot addon, launch it once before we begin.
- Launch the Termux app.

#### Inside Termux:
1. Install git:
```bash
pkg install git
```

2. Clone the repository:
```bash
git clone https://github.com/samlehman617/termux-setup
```
3. Launch the installation script:
```bash
cd termux-setup && ./install.sh
```
4. Follow the instructions the script provides and fill out prompts with the appropriate values.

#### Viewing Termux environment files outside Termux:
The `setup-termux.sh` script configures viewing Android internal storage files inside Termux. 
You can view files within Termux's `$HOME` directory in an external app. 
I recommend using: [Material Files](https://f-droid.org/en/packages/me.zhanghai.android.files/)

<a href="https://f-droid.org/en/packages/me.zhanghai.android.files/">
<img src="https://f-droid.org/repo/me.zhanghai.android.files/en-US/icon_CEMB2ychJvzyWhH3cGcWvpadqkMmDSQJc7ZbXZ7otMo=.png" alt="Material Files" width="48px"/>
</a>


Inside the app:
- Open the navigation drawer
- Press 'Add external storage...'
- In the dialog that pops up, open its navigation drawer
- Select the Termux entry
- Press 'Use this folder'



## To-Do:
- [ ] Add ability to configure X11
- [ ] Add documentation for setting up X server and VNC
- [ ] Add ability to install Linux distrobutions
- [ ] Add ability to configure BuildAPKs
- [ ] Use `termux-dialog` to gather all user options
- [ ] Add user dialog to select dotfiles repository
- [ ] Create supplementary repository for my dotfiles
- [ ] Create supplementary repository for Termux scripts
- [ ] Add script cleanup
