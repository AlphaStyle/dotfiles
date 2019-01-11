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
Plug 'tpope/vim-rhubarb' " Github
Plug 'tpope/vim-git' " Git Syntax
" }}}
" Far (Find and Replace) {{{
Plug 'brooth/far.vim'
" }}}
" Tabular (aligning stuff) {{{
Plug 'godlygeek/tabular'
" }}}
" Node.js {{{
Plug 'moll/vim-node'
" }}}
" Status line (Lightline) {{{
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
" }}}
" Golang {{{
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
" Plug 'fatih/vim-go', {'tag': 'v1.17', 'do': ':GoUpdateBinaries'}
" }}}
" General stuff {{{
Plug 'sheerun/vim-polyglot' " Syntax
Plug 'bronson/vim-trailing-whitespace' " Show and remove whitespace
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}
" Misc (Tagbar, Mutltiple-cursor, Superbar) {{{
Plug 'terryma/vim-multiple-cursors' " Edit with multiple cursors
Plug 'ervandew/supertab' " Tab AutoComplete etc with Tab button
Plug 'majutsushi/tagbar' " Tagbar support
" }}}
" Linting {{{
Plug 'neomake/neomake'
"" Use Local Eslint
Plug 'benjie/neomake-local-eslint.vim', {'for': ['js', 'javascript', 'javascript.jsx', 'jsx', 'vue', 'html']}
" }}}
" Snippets {{{
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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
Plug 'lervag/vimtex'
" }}}
" Unix filesystem helpers {{{
Plug 'tpope/vim-eunuch'
" }}}
" Enhance netrw Vinegar {{{
Plug 'tpope/vim-vinegar'
" }}}
" Mardown {{{
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" }}}
" Python {{{
" Plug 'davidhalter/jedi-vim', {'for': ['py', 'python']}
" }}}
" Syntaxes (polyglot got me covered) {{{
"*****************************************************************************
"" Syntax
"*****************************************************************************
" HCL Syntax {{{
Plug 'b4b4r07/vim-hcl'
" }}}
" HTML helpers {{{
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html']}
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}
" }}}
" CSS Color{{{
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
" }}}
" }}}
" Auto completion {{{
"*****************************************************************************
"" Auto Completion
"*****************************************************************************
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Go {{{
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': ['go', 'golang']}
" }}}
" Python {{{
Plug 'zchee/deoplete-jedi', {'for': ['py', 'python']}
" }}}
" Javascript {{{
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', {'for': ['js', 'jsx', 'javascript', 'javascript.jsx']} " Normal Projects
Plug 'steelsojka/deoplete-flow', {'for': ['js', 'jsx', 'javascript', 'javascript.jsx']} " Flow
Plug 'mhartington/nvim-typescript', {'for': ['ts', 'typescript']} " Typescript
" }}}
" File Icons (should load last, works better this way) {{{
 Plug 'ryanoasis/vim-devicons'
" }}}
" }}}
call plug#end()
filetype plugin indent on
" vim:foldmethod=marker:foldlevel=0
