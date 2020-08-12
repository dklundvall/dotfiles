#!/bin/zsh
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
#if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#    PATH="$HOME/bin:$PATH"
#fi

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/.local/bin" ] ; then
#    PATH="$HOME/.local/bin:$PATH"
#fi
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':'):$HOME/.emacs.d/bin"
export TERM=screen-256color

# Defaul programs
export SUDO_EDITOR="nvim"
export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
export FILE="ranger"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Home cleanup
export LESSHISTFILE="-"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

exec   startx "$XDG_CONFIG_HOME/X11/xinitrc"

