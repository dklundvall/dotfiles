# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#### AUTOJUMP #####
[[ -s /home/daniel/.autojump/etc/profile.d/autojump.sh ]] && source /home/daniel/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u


# Lines configured by zsh-newuser-install

export ZSH_DATA="$XDG_DATA_HOME/zsh"
HISTFILE=$ZSH_DATA
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

###### THEME ######
source $ZSH_DATA/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##### ACTIVATE PLUGINS ######
source $ZSH_DATA/themes/zsh-theme-gruvbox-dark.zsh-theme
source $ZSH_DATA/plugins/fsh/fast-syntax-highlighting.plugin.zsh

neofetch
