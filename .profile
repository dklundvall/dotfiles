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
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PYTHONPATH=$PYTHONPATH:"/usr/local/bin/python3.7:/home/daniel/Work/ss15m24_test"
export ROBOT_OPTIONS='-P /home/daniel/Work/ss15m24_test/venv/lib/python3.6/site-packages:/home/daniel/Work/ss15m24_test'

export TERM=screen-256color

# Defaul programs
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export FILE="ranger"

