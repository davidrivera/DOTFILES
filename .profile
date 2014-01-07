# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH:/opt/Xilinx/14.4/ISE_DS/ISE/bin/lin64:/home/david/Tools/eclipse:/home/david/cerbero/android-ndk-r8e/toolchains/arm-linux-androideabi-4.7/prebuilt/linux-x86_64/bin:/home/david/android/adt-bundle-linux-x86_64-20130219/sdk/tools:/home/david/Tools/android-studio/bin"
fi
alias lock="gnome-screensaver-command -l"
export GOROOT=$HOME/Tools/go
export PATH=$PATH:$GOROOT/bin
