########## GOPATH ##########
export GOPATH="$HOME/go"

########## PATH ##########
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Applications/Racket\ v8.12/bin


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
alias ll="ls -al"
# Adds color to grep command results
alias grep="grep --color"
# Shows hidden files and adds color to tree command
alias tree="tree -aC" #use -d to list only directories
# Shows hidden files in ripgrep
alias rg="rg --hidden"
# Shortcut for ranger
alias ra="ranger"
# Vim keybindings for lynx
alias lynx="lynx -accept_all_cookies -editor=vim -use_mouse -vikeys"
# mutt -> neomutt
alias mutt="neomutt"
# weather
alias weather="curl wttr.in/San+Francisco"
# gcc
alias gcc='gcc-13'
alias cc='gcc-13'
alias g++='g++-13'
alias c++='c++-13'
#
########## FZF ##########
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# export BAT_THEME="base16"
# export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

########## ZSH/TERM ##########

# Default editor
export VISUAL=vi
autoload -U colors && colors
# Custom prompt
#             %F{2} for green
#             %F{10} for light green
#                       \d to add date
#                       \t to add time
#                       \w to add path to directory
export PS1="\[\e[0;92m\]\d [\t] \W $ \[\e[m\]"
# bash autocompletion
if [ -f /sw/etc/bash_completion ]; then
   . /sw/etc/bash_completion
fi
# locale config
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
# Terminfo
case "$TERM" in
*-256color)
    alias ssh='TERM=${TERM%-256color} ssh'
    ;;
*)
    POTENTIAL_TERM=${TERM}-256color
    POTENTIAL_TERMINFO=${TERM:0:1}/$POTENTIAL_TERM

    # better to check $(toe -a | awk '{print $1}') maybe?
    BOX_TERMINFO_DIR=/usr/share/terminfo
    [[ -f $BOX_TERMINFO_DIR/$POTENTIAL_TERMINFO ]] && \
        export TERM=$POTENTIAL_TERM

    HOME_TERMINFO_DIR=$HOME/.terminfo
    [[ -f $HOME_TERMINFO_DIR/$POTENTIAL_TERMINFO ]] && \
        export TERM=$POTENTIAL_TERM
    ;;
esac

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export GPG_TTY=$(tty)

# source shortcuts
# source ~/bin/shortcuts.sh

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

