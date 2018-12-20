" Plug Package Manager {{{
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
" File tree with git status highlight {{{
" Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" Plug 'xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': 'NERDTreeToggle'}
" }}}
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
" Grundo (Undo interface) {{{
" Plug 'sjl/gundo.vim'
" }}}
" Ack Search with AG {{{
Plug 'mileszs/ack.vim'
" }}}
" FZF Fuzzy Finder {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}
" Misc (Tagbar, Mutltiple-cursor, Superbar, clever-f) {{{
Plug 'terryma/vim-multiple-cursors' " Edit with multiple cursors
Plug 'ervandew/supertab' " Tab AutoComplete etc with Tab button
Plug 'majutsushi/tagbar' " Tagbar support
" Plug 'rhysd/clever-f.vim' " Improve f,F t,T
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
" Golang {{{
Plug 'fatih/vim-go', {'tag': 'v1.17', 'do': ':GoUpdateBinaries'}
" }}}
" Color Theme {{{
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'
" Plug 'tomasr/molokai'
" Plug 'trevordmiller/nova-vim' " old scheme
" }}}
" Tmux lightline {{{
" Plug 'edkolev/tmuxline.vim'
" }}}
" LimeLight {{{
Plug 'junegunn/limelight.vim'
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
" Vue Syntax {{{
" Plug 'posva/vim-vue', {'for': ['vue']}
" }}}
" Docker highlight {{{
" Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
" }}}
" Tmux syntax {{{
" Plug 'tmux-plugins/vim-tmux'
" }}}
" HTML {{{
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html']}
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}
" Plug 'tpope/vim-haml', {'for': ['haml']}
" Plug 'othree/html5.vim', {'for': ['html']}
" }}}
" CSS{{{
" Plug 'hail2u/vim-css3-syntax', {'for': ['css']}
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
" }}}
" SASS {{{
" Plug 'cakebaker/scss-syntax.vim', {'for': ['sass', 'scss']}
" }}}
" Typescript {{{
" Plug 'leafgarland/typescript-vim', {'for': ['ts', 'typescript']}
" Plug 'mhartington/nvim-typescript' " Using typescript-vim instead
" }}}
" Javascript {{{
" Plug 'pangloss/vim-javascript', {'for': ['js', 'javascript', 'vue']}
" Plug 'jelera/vim-javascript-syntax', {'for': ['js', 'javascript']}
" Plug 'othree/yajs.vim', {'for': ['js', 'javascript']}
" Plug 'othree/javascript-libraries-syntax.vim'
" }}}
" JSDoc and syntax {{{
" Plug 'othree/jsdoc-syntax.vim'
" Plug 'heavenshell/vim-jsdoc'
" }}}
" JSX {{{
" Plug 'mxw/vim-jsx', {'for': ['jsx']}
" }}}
" JSON {{{
" Plug 'elzr/vim-json', {'for': ['jsx', 'js', 'javascript', 'json']}
" }}}
" }}}
" Auto completion {{{
"*****************************************************************************
"" Auto Completion
"*****************************************************************************
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
" }}}
" File Icons (should load last, works better this way) {{{
 Plug 'ryanoasis/vim-devicons'
" }}}
call plug#end()
filetype plugin indent on
" }}}
" Basic Settings {{{
"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" Encoding {{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set fileformats=unix,dos,mac
" }}}
" Mouse settings {{{
set mouse=v " Paste with middle-click on mouse
set mouse=a " Enable mouse
set mousemodel=popup
" }}}
" Spelling {{{
"set spell spelllang=en_us " Spell check (Using toggle instead, <leader>s)
" }}}
" Tabs {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start " Fix backspace indent
" }}}
" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" }}}
" Faster load, render {{{
set lazyredraw
set noshowcmd
set autoread
" }}}
" Map leader {{{
let mapleader=','
" }}}
" Searching {{{
set hlsearch
set incsearch
" set ignorecase
set smartcase
set infercase
" }}}
" Auto completion when setting a setting :set auto<<TAB>> {{{
set wildmenu
set wildmode=full
" }}}
" Directories for swp files {{{
set nobackup
set noswapfile
" }}}
" Buffers {{{
set hidden " Enable hidden buffers
" }}}
" Shell {{{
set shell=/bin/zsh
" }}}
" }}}
" Visual Settings {{{
"*****************************************************************************
"" Visual Settings
"*****************************************************************************
" Number, Ruler, Wrap {{{
let no_buffers_menu=1
syntax on
set ruler
set textwidth=79
set wrap " Wrap text
set wm=2 " Hard Wrap text
set number
set relativenumber
" }}}
" Highlight matching word and line {{{
set showmatch " Highlight matching [{()}]
set nocursorline " (TurnOff) Highligh the line the cursor is on
set nocursorcolumn " (TurnOff)
set synmaxcol=200 " Limit syntax highlight for only the first 200 lines of code
" }}}
" Color Theme {{{
" colorscheme molokai
" colorscheme nova
" colorscheme neodark
colorscheme onedark
let g:neodark#terminal_transparent = 1
let g:neodark#use_256color = 1
let g:neodark#solid_vertsplit = 1
" let g:neodark#use_custom_terminal_theme = 1
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
    set background=dark
endif
" }}}
" IndentLine {{{
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_setColors = 0
let g:indentLine_faster = 1
" let g:indentLine_setConceal = 0
" }}}
" Disable the blinking cursor {{{
set gcr=a:blinkon0
set scrolloff=3
" }}}
" Status bar {{{
set laststatus=2
" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
" }}}
" Use modeline overrides {{{
set modeline
set modelines=10
" }}}
" Title {{{
set title
set titleold="Terminal"
set titlestring=%F
" }}}
" Disable visualbell {{{
set noerrorbells visualbell t_vb=
" }}}
" }}}
" Abbreviations {{{
"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
" }}}
" Autocmd Rules {{{
"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
" The PC is fast enough, do syntax highlight syncing from start {{{
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END
" }}}
" Remember cursor position {{{
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
" }}}
" LaTeX / LeXical / Markdown {{{
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,text,tex,textile,vimwiki call lexical#init({ 'spell': 1 }) |
              \  DittoOn
augroup END
"}}}
" Markdown {{{
" augroup vimrc-markdown
"     autocmd!
"     autocmd FileType markdown set conceallevel=1
" augroup END
" }}}
" Vim-Python {{{
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
                \ formatoptions+=croq softtabstop=4 smartindent
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END
" }}}
" Auto format javascript with standard {{{
" augroup standard-auto-format
"     autocmd!
"     autocmd BufWritePost *.js silent !standard --fix %
" augroup END
" }}}
" vim-go {{{
augroup FileType go
    au!
    au FileType go nmap gd <Plug>(go-def)
    au FileType go nmap <Leader>dd <Plug>(go-def-vertical)

    au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
    au FileType go nmap <Leader>db <Plug>(go-doc-browser)

    au FileType go nmap <Leader>gi <Plug>(go-info)

    au FileType go nmap <leader>gr <Plug>(go-run-split)
    au FileType go nmap <leader>rb <Plug>(go-build)
    au FileType go nmap <leader>gt <Plug>(go-test)
    au FileType go nmap <leader>gl <Plug>(go-metalinter)
    au FileType go nmap <leader>gv <Plug>(go-coverage)
augroup END
" }}}
" For HTML files, 2 spaces {{{
" augroup html-file-option
"     autocmd!
"     autocmd Filetype html setlocal ts=2 sw=2 expandtab
" augroup END
" }}}
" Vue files {{{
augroup vue-file-option-tabs
    autocmd!
"     autocmd Filetype vue setlocal ts=2 sw=2 expandtab noshowcmd lazyredraw
"     autocmd FileType vue syntax sync fromstart
    autocmd FileType vue setlocal relativenumber!
augroup END
" }}}
"}}}
" Mappings {{{
"*****************************************************************************
"" Mappings
"*****************************************************************************
" Toggle Spelling {{{
nnoremap <leader>sp :set invspell<CR>
" }}}
" Git {{{
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>
" }}}
" Terminal emulation {{{
nnoremap <silent> <leader>sh :terminal<CR>
" }}}
" Split horizontal and vertical {{{
noremap <Leader>v :<C-u>split<CR>
noremap <Leader>h :<C-u>vsplit<CR>
" }}}
" Switching windows {{{
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
" }}}
" Tabs {{{
nnoremap <Tab> gt
" nnoremap <S-Tab> gT (Shit + Tab Allready used by Reverse indenting)
nnoremap <silent> <S-t> :tabnew<CR>
" Close Current tab
noremap <leader>c :tabclose<CR>
" }}}
" Buffer nav {{{
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>
"" Close buffer
noremap <leader>C :bd<CR>
" }}}
" Set working directory {{{
nnoremap <leader>. :lcd %:p:h<CR>
" }}}
" Create new file in directory (buffer / tab) {{{
" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" }}}
" Clipboard shortcuts {{{
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>
" }}}
" Clean search (highlight) {{{
nnoremap <silent> <leader><space> :noh<cr>
" }}}
" Ack search (Open ack.vim) {{{
nnoremap <Leader>a :Ack!<Space>
"nnoremap <Leader>A :Ag!<Space>
" }}}
" FZF Fuzzyfinder {{{
nmap <leader>f :Find<CR>
nmap <leader><leader>f :Files<CR>
nmap <leader>b :Buffers<Space>
nmap <leader><leader>b :Buffers<CR>
" }}}
" Vmap for maintain Visual Mode after shifting > and < {{{
vmap < <gv
vmap > >gv
" }}}
" Move visual block {{{
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Move selected lines up / down  one line
nnoremap <Leader><Up>   :<C-u>silent! move-2<CR>==
nnoremap <Leader><Down> :<C-u>silent! move+<CR>==
xnoremap <Leader><Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <Leader><Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv
" }}}
" Reverse indent for command mode {{{
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
" }}}
" Tagbar {{{
nmap <silent> <F4> :TagbarToggle<CR>
" }}}
" NERDTree {{{
" nnoremap <silent> <F2> :NERDTreeFind<CR>
" nnoremap <silent> <leader><F2> :NERDTreeTabsFind<CR>
" noremap <F3> :NERDTreeToggle<CR>
" noremap <leader><F3> :NERDTreeTabsToggle<CR>
" }}}}
" Toggle gundo {{{
" nnoremap <leader>u :GundoToggle<CR>
" }}}
" }}}
" Custom Configs {{{
"*****************************************************************************
"" Custom configs
"*****************************************************************************
" Tagbar configuration {{{
let g:tagbar_autofocus = 1
" }}}
" Neomake {{{
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('w')
" call neomake#configure#automake('rw', 1000)
"" Show info if needed
let g:neomake_open_list = 2
" }}}
" NERDTree configuration {{{
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" }}}
" NeoSnippet {{{
"" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" }}}
" Ultisnipet {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
" }}}
" Use tern_for_vim {{{
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
" }}}
" Use ternjs (javascript) {{{
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
" Add extra file types to ternjs for javascript
let g:tern#filetypes = [
            \ 'jsx',
            \ 'javascript.jsx',
            \ 'javascript',
            \ 'js',
            \ 'vue'
            \ ]
" }}}
" Use deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
            \ 'tern#Complete',
            \ 'jspc#omni'
            \ ]
" }}}
" Copy/Paste/Cut Clipboard {{{
set clipboard^=unnamed,unnamedplus
" }}}
" Ag / Ack - Make ag default for ack {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"}}}
" Goang {{{
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
            \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
            \ 'r:constructor', 'f:functions' ],
            \ 'sro' : '.',
            \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
            \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
set autowrite

let g:go_highlight_functions = 1
let g:go_highlight_functions_arguments = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
"" Automatically imports/remove packages
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
" }}}
" Javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
" }}}
" JSX {{{
let g:jsx_ext_required = 0
" }}}
" Python Jedi-vim {{{
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
" }}}
" Polyglot (Syntax) {{{
" Disable Polyglot syntax for x
let g:polyglot_disabled = ['go']
" }}}
" Clever-f {{{
" let g:clever_f_across_no_line = 1
" let g:clever_f_timeout_ms = 3000
" }}}
" LimeLight {{{
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Default: 0.5
let g:limelight_default_coefficient = 0.7
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
" }}}
" LaTeX {{{
let g:lexical#spell = 1         " 0=disabled, 1=enabled
let g:lexical#spelllang = ['en_us', 'nb',]
let g:lexical#dictionary = ['/usr/share/dict/words',]
let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/mthesaur.txt',]
let g:lexical#spellfile = ['~/.config/nvim/spell/en.utf-8.add',]
" let g:vim_markdown_conceal = 1
" }}}
" Markdown {{{
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_conceal = 1
" }}}
" VimWiki {{{
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/school/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_2.path = '~/vimwiki/programming/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'

let g:vimwiki_list = [wiki_1, wiki_2]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" }}}
" FZF Fuzzy finder (with ripgrep) {{{
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --fixed-strings --ignore-case
            \   --no-ignore --hidden --follow --glob "!.git/*" --color "always"
            \   '.shellescape(<q-args>), 1,
            \ <bang>0 ? fzf#vim#with_preview('up:60%')
            \         : fzf#vim#with_preview('right:50%:hidden', '?'),
            \ <bang>0)
" }}}
" }}}
" Lightline Config {{{
"*******************************************************************************************
"" Lightline
"*******************************************************************************************
set noshowmode
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \   'active': {
            \       'left': [ ['mode', 'paste'], ['gitgutter', 'fugitive', 'filename'], ['neomake'] ],
            \       'right': [ ['percent', 'lineinfo'], ['fileformat', 'fileencoding', 'filetype'] ]
            \   },
            \   'component_function': {
            \       'fugitive': 'LightlineFugitive',
            \       'readonly': 'LightlineReadonly',
            \       'modified': 'LightlineModified',
            \       'filename': 'LightlineFilename',
            \       'fileformat': 'LightlineFileformat',
            \       'filetype': 'LightlineFiletype',
            \       'fileencoding': 'LightlineFileencoding',
            \       'neomake':  'LightlineNeomake',
            \       'gitgutter': 'LightlineGitGutter'
            \   }
            \}

"" Will show whether or not the file has been modified
function! LightlineModified()
    return winwidth(0) > 70 ? (&ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-') : ''
endfunction

"" Will show whether it is read only or not
function! LightlineReadonly()
    return winwidth(0) > 70 ? (&ft !~? 'help' && &readonly ? '' : '') : ''
endfunction

"" Will Show Git Status
function! LightlineFugitive()
    if exists("*gitbranch#name")
        let branch = gitbranch#name()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

"" Will Show Filename
function! LightlineFilename()
    return winwidth(0) > 70 ? ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightlineModified() ? ' ' . LightlineModified() : '') : ''
endfunction

"" Will Show File Format
function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat . ' ' . WebDevIconsGetFileFormatSymbol() : ''
endfunction

"" Will Show File Type
function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? (&filetype . ' ' . WebDevIconsGetFileTypeSymbol()) : 'no ft') : ''
endfunction

"" Will Show File Encoding
function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

"" Will Show whether there are any linting errors (NeoMake)
function! LightlineNeomake()
    if !exists('*neomake#statusline#LoclistCounts')
        return ''
    endif

    " Count all the errors, warnings
    let total = 0

    for v in values(neomake#statusline#LoclistCounts())
        let total += v
    endfor

    for v in items(neomake#statusline#QflistCounts())
        let total += v
    endfor

    if total == 0
        return ''
    endif

    if winwidth(0) > 70
        return 'NeoMake: '.total
    else
        return ''
    endif
endfunction

"" Will Show if there has been any changes compared with git
function! LightlineGitGutter()
    if winwidth(0) > 70
        if exists('*GitGutterGetHunkSummary')
            let [ added, modified, removed ] = GitGutterGetHunkSummary()
            return printf('+%d ~%d -%d', added, modified, removed)
        endif
        return ''
    endif
    return ''
endfunction
" }}}
" TmuxLine Config {{{
"*****************************************************************************
"" Tmuxline
"*****************************************************************************
let g:tmuxline_preset = {
            \'a'    : 'Dev',
            \'win'    : '#W',
            \'cwin'    : '#W',
            \'y'    : ['%R', '%a', '%Y'],
            \'z'    : '#H'}

let g:tmuxline_separators = {
            \ 'left' : '',
            \ 'left_alt': '|',
            \ 'right' : '',
            \ 'right_alt' : '|',
            \ 'space' : ' '}
" }}}
" vim:foldmethod=marker:foldlevel=0
