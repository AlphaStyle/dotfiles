# Universal Golang Variables
set -Ux GOPATH ~/projects
set -Ux GOROOT ~/usr/lib/go

# Universal Ruby Variable
# RUBY_BIN (ruby -e 'print Gem.user_dir')"/bin"

# Universal Node.js variable
set -Ux npm_config_prefix ~/.node_modules

# fzf default command with ripgrep
set -Ux FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# HasiCopr Binary folder (Nomad, Consul, Vault)
set -Ux HASICORP_BIN $HOME/container/hasicorp-exercise/bin

# Default Universal Variables
set -Ux VISUAL nvim
set -Ux EDITOR nvim
set -Ux PAGER most
set -Ux TERM tmux-256color

# Path
set -x PATH $GOROOT $GOPATH $GOPATH/bin $HASICORP_BIN $PATH

# Aliases
# Easy shortcuts
alias vim="nvim"
alias zshconfig="nvim ~/.zshrc"
alias fishconfig="nvim ~/.config/fish/config.fish"
alias tmuxconfig="nvim ~/.tmux.conf"
alias vimconfig="nvim ~/.config/nvim/init.vim"

# Tmux shotcuts
alias tls="tmux ls"
alias tns="tmux new-session -s"
alias tat="tmux attach -t"
alias tkill="tmux kill-session -t"
