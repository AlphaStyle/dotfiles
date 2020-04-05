# Golang Variables
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/lib/go
export GO11MODULE=auto

# Ruby Variables
export RUBYBIN=$(ruby -e 'print Gem.user_dir')/bin
export GEMPATH=$(ruby -r rubygems -e 'puts Gem.user_dir')/bin
export GEM_HOME=$HOME/.gem

# Pythong / Pip local bin folder
export LOCALBIN=$HOME/.local/bin

# Cargo (Rust)  Bin
export CARGOBIN=$HOME/.cargo/bin

# Apache Maven Bin
export MAVENBIN=/usr/share/apache-maven/bin

# Universal Node.js variable
export npm_config_prefix=$HOME/.node_modules
export NPMBIN=$HOME/.node_modules/bin

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
export PAGER=most
# export TERM="tmux256color"
export TERM='xterm-256color'

# Path
export PATH=$GOROOT:$GOPATH:$GOBIN:$GEMPATH:$GEM_HOME:$RUBYBIN:$PATH
export PATH=$MAVENBIN:$LOCALBIN:$CARGOBIN.$NPMBIN:$PATH 
export PATH=$PATH

# Aliases
alias vim="nvim"
alias zshconfig="nvim ~/.zshrc"
alias tmuxconfig="nvim ~/.tmux.conf"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias waybarconfig="nvim ~/.config/waybar/config"
alias swayconfig="nvim ~/.config/sway/config"

alias tls="tmux ls"
alias tns="tmux new-session -s"
alias tat="tmux attach -t"
alias tkill="tmux kill-session -t"

alias ls='ls --color=auto'

fpath+=$HOME/.zsh/pure
autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
# prompt walters
# prompt redhat
prompt pure

# Completion
fpath=(/usr/share/zsh/site-functions/ $fpath)

# Syntax Highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Suggetions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/tb/.sdkman"
[[ -s "/home/tb/.sdkman/bin/sdkman-init.sh" ]] && source "/home/tb/.sdkman/bin/sdkman-init.sh"
