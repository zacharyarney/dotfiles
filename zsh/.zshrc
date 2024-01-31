########## GOPATH ##########

export GOPATH="$HOME/go"


########## PATH ##########

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(pyenv init --path)"


########## ALIASES ##########

# adds color and formatting to ls command results
alias ls='ls -FG'
# shows hidden files, distinguishes types and adds color to ls command results
alias la='ls -AFG'
# Long listing format with ./ and ../ so we can view permissions of current dir
alias ll='ls -al'
# Open a scratch buffer in vim (ns short for "new scratch" same as vim shortcut)
alias ns='vim "+:call Scratch()" "+:call WordProcessorMode()"'
# Adds color to grep command results
alias grep='grep --color'
# Shows hidden files and adds color to tree command
alias tree='tree -aC' #use -d to list only directories
# Shows hidden files in ripgrep
alias rg='rg --hidden'
# Shortcut for ranger
alias ra=ranger
# Vim keybindings for lynx
alias lynx='lynx -accept_all_cookies -editor=vim -use_mouse -vikeys'
# mutt -> neomutt
alias mutt=neomutt
# weather
alias weather='curl wttr.in/San+Francisco'
# gcc
alias gcc='gcc-13'
alias cc='gcc-13'
alias g++='g++-13'
alias c++='c++-13'
# bat
alias bat='bat --theme=base16'
# spotify
alias {spot,spotify,sp}=spotify_player


########## FZF ##########

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_CTRL_T_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS="--preview='less {}' --height 40%"
export FZF_CTRL_T_OPTS="--preview='less {}' --height 40%"
# colors
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:250,bg:233,hl:67 --color=fg+:255,bg+:236,hl+:110 --color=info:101,prompt:131,pointer:73 --color=marker:208,spinner:250,header:66'
export BAT_THEME="base16"


########## ZSH/TERM ##########

# Default editor
export VISUAL=vi
autoload -U colors && colors
# export COLORTERM="truecolor"
# Custom prompt
#             %F{2} for green
#             %F{10} for light green
#                       \d to add date
#                       \t to add time
#                       \w to add path to directory
export PS1="%{%F{10}%}[%*] %1d %% %{$reset_color%}"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GPG_TTY=$(tty)

# source shortcuts
# source ~/bin/shortcuts.sh


# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

