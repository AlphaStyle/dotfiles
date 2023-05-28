# Golang Variables
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/lib/go
export GO111MODULE=auto

# Ruby Variables
export RUBYBIN=$(ruby -e 'print Gem.user_dir')/bin
export GEMPATH=$(ruby -r rubygems -e 'puts Gem.user_dir')/bin
export GEM_HOME=$HOME/.gem

# Python / Pip local bin folder
export LOCALBIN=$HOME/.local/bin

# Cargo (Rust)  Bin
export CARGOBIN=$HOME/.cargo/bin

# Apache Maven Bin
# export MAVENBIN=/usr/share/apache-maven/bin

# Universal Node.js variable
# export npm_config_prefix=$HOME/.node_modules
# export NPMBIN=$HOME/.node_modules/bin
# export NPMBIN=$(yarn global bin)

# fzf default command with ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# fix rendering for java applications on sway
# export _JAVA_AWT_WM_NONREPARENTING=1

# export QT_QPA_PLATFORM=wayland
# export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_WAYLAND_DISABLE_WINDOWDECORATION='1'
# export GTK_THEME='Arc-Darker'

# Default Universal Variables
export TERMINAL="alacritty"
export BROWSER="firefox"
export VISUAL=nvim
export EDITOR=nvim
#export PAGER=most
export PAGER=less # Bat is not compatable with most :(
# export TERM="tmux256color"
# export TERM='xterm-256color'
export TERM='screen-256color'

export NNN_PLUG='d:diffs;v:imgview;p:preview-tui;n:nuke'

# Path
# APPEND_PATH=$GOROOT:$GOPATH:$GOBIN:$GEMPATH:$GEM_HOME:$RUBYBIN
# APPEND_PATH=$MAVENBIN:$LOCALBIN:$CARGOBIN:$NPMBIN
APPEND_PATH=$GEMPATH:$GEM_HOME:$RUBYBIN:$CARGOBIN:$LOCALBIN
export PATH=$APPEND_PATH:$PATH
# export PATH=$PATH

# Aliases
alias vim="nvim"
alias zshconfig="nvim ~/.zshrc"
alias tmuxconfig="nvim ~/.tmux.conf"
alias vimconfig="nvim ~/.config/nvim/init.lua"
alias waybarconfig="nvim ~/.config/waybar/config"
alias swayconfig="nvim ~/.config/sway/config"

alias tls="tmux ls"
alias tns="tmux new-session -s"
alias tat="tmux attach -t"
alias tkill="tmux kill-session -t"

alias ls='ls --color=auto'

fpath=($HOME/.zsh/pure $fpath)
fpath=($HOME/.zfunc $fpath)

# Completion
fpath=(/usr/share/zsh/site-functions/ $fpath)

autoload -Uz compinit bashcompinit promptinit
compinit -C
bashcompinit -C
promptinit

# This will set the default prompt to the walters theme
# prompt walters
# prompt redhat
prompt pure

# Syntax Highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Suggetions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# pipx completions
# eval "$(register-python-argcomplete pipx)"

# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
