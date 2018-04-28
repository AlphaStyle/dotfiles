# Path to your oh-my-zsh installation.
export ZSH=/home/alphastyle/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="cloudy"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-completions zsh-syntax-highlighting compleat zsh-autosuggestions zsh-better-npm-completion alias-tips notify)

source $ZSH/oh-my-zsh.sh

#-----------------------------
# User configuration
#-----------------------------
# Vi mode
bindkey -v

# Show normal-mode when click <ESC>
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

# Run zle-line-init and zle-keymap-select on startup
zle -N zle-line-init
zle -N zle-keymap-select
# Reduce <ESC> delay
export KEYTIMEOUT=1

#-----------------------------
# Exporting
#----------------------------
# export TERM=xterm-256color
export TERM=tmux-256color
# export TERM=screen-256color
# export TERM=xterm-termite
# export TERM=st-256color # Add True colors to tmux

# Golang
export GOPATH=~/projects
export GOROOT=/usr/lib/go
# Ruby
export RubyBin=$(ruby -e 'print Gem.user_dir')/bin

export EDITOR='nvim'
export PAGER="most"

export PATH=${PATH}:$GOPATH:$GOROOT:$GOPATH/bin:$RubyBin

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#-----------------------------
# Aliases
#----------------------------
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vim="nvim"
alias zshconfig="nvim ~/.zshrc"
alias tmuxconfig="nvim ~/.tmux.conf"
alias vimconfig="nvim ~/.config/nvim/init.vim"

alias tls="tmux ls"
alias tns="tmux new-session -s"
alias tat="tmux attach -t"
alias tkill="tmux kill-session -t"
# ls with colors and icons!
# alias lc='colorls -r'
# alias tldr='tldr -t base16'

#------------------------------
# Comp stuff
#------------------------------
fpath=(~/.zsh/completion $fpath)

zmodload zsh/complist
autoload -Uz compinit && compinit -i

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
