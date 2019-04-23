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
# set -Ux HASICORP_BIN $HOME/container/hasicorp-exercise/bin

# Default Universal Variables
set -Ux VISUAL nvim
set -Ux EDITOR nvim
set -Ux PAGER most
# set -Ux TERM "tmux-256color"
set -gx TERM "tmux-256color"

# Path
set -x PATH $GOROOT $GOPATH $GOPATH/bin $PATH
# set -x PATH $HASICORP_BIN

# Aliases
# Easy shortcuts
# alias vim="nvim"
function vim -d 'overwrite vim to be nvim'
    nvim
end

# alias zshconfig="nvim ~/.zshrc"
function zshconfig -d 'open zsh config'
    nvim ~/.zshrc
end

# alias fishconfig="nvim ~/.config/fish/config.fish"
function fishconfig -d 'open fish config'
    nvim ~/.config/fish/config.fish
end

# alias tmuxconfig="nvim ~/.tmux.conf"
function tmuxconfig -d 'open tmux config'
    nvim ~/.tmux.conf
end

# alias vimconfig="nvim ~/.config/nvim/init.vim"
function vimconfig -d 'open neovim config'
    nvim ~/.config/nvim/init.vim
end

# Tmux shotcuts
# alias tls="tmux ls"
function tls -d 'list all tmux sessions'
    tmux ls
end

# alias tns="tmux new-session -s"
function tns -d 'make a new tmux session with <name>'
    tmux new-session -s
end

# alias tat="tmux attach -t"
function tat -d 'attach tmuc pane/window'
    tmux attach -t
end

# alias tkill="tmux kill-session -t"
function tkill -d 'kill a tmux session'
    tmux kill-session -t
end

