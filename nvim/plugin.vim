"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
    set nocompatible " Be iMproved
    filetype off
endif
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
call plug#begin(expand('~/.config/nvim/plugged'))
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
" VimWiki {{{
Plug 'vimwiki/vimwiki'
"}}}
" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-rhubarb' " Github
" Plug 'tpope/vim-git' " Git Syntax
" }}}
" Far (Find and Replace) {{{
" Plug 'brooth/far.vim'
" }}}
" Tabular (aligning stuff) {{{
" Plug 'godlygeek/tabular'
" }}}
" Status line (Lightline) {{{
" Plug 'itchyny/lightline.vim'
" Plug 'itchyny/vim-gitbranch'
" }}}
" Golang {{{
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
" }}}
" Rust {{{
Plug 'rust-lang/rust.vim'
" }}}
" General stuff {{{
Plug 'sheerun/vim-polyglot' " Syntax
Plug 'Raimondi/delimitMate' " Auto close {[
Plug 'Yggdroot/indentLine' " Show Indent lines
" }}}
" Easy commenting {{{
Plug 'tpope/vim-commentary' " Comment stuff out
" }}}
" Surrounding {{{
Plug 'tpope/vim-surround'
" }}}
" Ack Search with AG {{{
Plug 'mileszs/ack.vim'
" }}}
" FZF Fuzzy Finder {{{
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" }}}
" Misc (Tagbar, Mutltiple-cursor, Superbar) {{{
Plug 'terryma/vim-multiple-cursors' " Edit with multiple cursors
Plug 'ervandew/supertab' " Tab AutoComplete etc with Tab button
Plug 'majutsushi/tagbar' " Tagbar support
" }}}
" ALE - Linting / Completion {{{
Plug 'w0rp/ale'
" }}}
" Snippets {{{
" Plug 'Shougo/neosnippet'
" Plug 'SirVer/ultisnips'
" }}}
" Editorconfig {{{
Plug 'editorconfig/editorconfig-vim'
" }}}
" Color Theme {{{
Plug 'joshdick/onedark.vim'
" }}}
" Tmux lightline {{{
" Plug 'edkolev/tmuxline.vim'
" }}}
" LaTeX and Ditto {{{
Plug 'reedes/vim-lexical'
Plug 'dbmrq/vim-ditto'
" Plug 'lervag/vimtex'
" }}}
" Enhance netrw Vinegar {{{
" Plug 'tpope/vim-vinegar'
" }}}
" Mardown {{{
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" }}}
" Syntaxes (polyglot got me covered) {{{
"*****************************************************************************
"" Syntax
"*****************************************************************************
" HTML helpers {{{
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html', 'svelte', 'vue']}
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'vue', 'svelte']}
" }}}
" CSS Color{{{
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
" }}}
" }}}
call plug#end()
filetype plugin indent on
" vim:foldmethod=marker:foldlevel=0
