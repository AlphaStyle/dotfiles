"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************
if has('vim_starting')
    set nocompatible " Be iMproved
    filetype off
endif
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
call plug#begin(expand('~/.config/nvim/plugged'))
" Plug 'vimwiki/vimwiki'
Plug 'kkoomen/vim-doge' " Documentation
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-rhubarb' " Github
" Plug 'tpope/vim-git' " Git Syntax
" Plug 'brooth/far.vim' " Far (Find and Replace)
" Plug 'godlygeek/tabular' " Tabular (aligning stuff)

" Status line (Lightline)
" Plug 'itchyny/lightline.vim'
" Plug 'itchyny/vim-gitbranch'

Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot' " Syntax
Plug 'Raimondi/delimitMate' " Auto close
Plug 'Yggdroot/indentLine' " Show Indent lines
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim' " Ack Search with AG

" FZF Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'terryma/vim-multiple-cursors' " Edit with multiple cursors
Plug 'ervandew/supertab' " Tab AutoComplete etc with Tab button
Plug 'majutsushi/tagbar' " Tagbar support

" NeovimLanguageClient completion
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'jackguo380/vim-lsp-cxx-highlight' " C-language sementic syntext highligh
Plug 'w0rp/ale' " Linting

" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'

Plug 'editorconfig/editorconfig-vim'
Plug 'joshdick/onedark.vim' " Color theme
" Plug 'edkolev/tmuxline.vim' " Tmux lightline
Plug 'reedes/vim-lexical'
Plug 'dbmrq/vim-ditto' " Stop repeating yourself!
" Plug 'lervag/vimtex'
" Plug 'tpope/vim-vinegar' "Enhance netrw Vinegar

" Mardown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" HTML helpers
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html', 'svelte', 'vue']}
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'vue', 'svelte']}
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
call plug#end()
filetype plugin indent on
