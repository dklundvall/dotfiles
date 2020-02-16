# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export TERM=screen-256color

# Defaul programs
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export FILE="ranger"

export XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR=~/.config/zsh

exec startx

