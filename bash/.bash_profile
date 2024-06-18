
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

. "$HOME/.cargo/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/zacharyarney/.sdkman"
[[ -s "/Users/zacharyarney/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/zacharyarney/.sdkman/bin/sdkman-init.sh"
