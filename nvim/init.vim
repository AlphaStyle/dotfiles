"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
"" File tree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"" Statusline
Plug 'itchyny/lightline.vim'

"" General stuff
Plug 'sheerun/vim-polyglot' " Syntax
Plug 'bronson/vim-trailing-whitespace' " Show and remove whitespace
Plug 'Raimondi/delimitMate' " Auto close {[
Plug 'Yggdroot/indentLine' " Show Indent lines

"" Misc
Plug 'terryma/vim-multiple-cursors' " Edit with multiple cursors
Plug 'ervandew/supertab' " Tab AutoComplete etc with Tab button
Plug 'majutsushi/tagbar' " Tagbar support
" Plug 'scrooloose/syntastic' "Using NeoMake instead

"" Linting
Plug 'neomake/neomake'

"" Snippets
Plug 'Shougo/neosnippet', {'for': ['html', 'js', 'javascript', 'css']}
Plug 'Shougo/neosnippet-snippets', {'for': ['html', 'js', 'javascript', 'css']}
Plug 'SirVer/ultisnips', {'for': ['html', 'js', 'javascript', 'css']}
Plug 'honza/vim-snippets', {'for': ['html', 'js', 'javascript', 'css']}

"" Vue Syntax
" Plug 'posva/vim-vue', {'for': ['vue']}

"" Color
" Plug 'tomasr/molokai'
" Plug 'jacoborus/tender.vim'
" Plug 'chriskempson/vim-tomorrow-theme'
Plug 'trevordmiller/nova-vim'

"" Tmux lightline
" Plug 'edkolev/tmuxline.vim'

"" Mardown
Plug 'vim-pandoc/vim-pandoc', {'for': ['md', 'markdown']}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': ['md', 'markdown']}

"" Editorconfig
Plug 'editorconfig/editorconfig-vim'

"" Golang
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

"" Docker highligh
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

"" html
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html']}
" Plug 'gorodinskiy/vim-coloresque'
" Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim', {'for': ['html']}

"" CSS
" Plug 'hail2u/vim-css3-syntax', {'for': ['css']}
Plug 'ap/vim-css-color'

"" Typescript
" Plug 'leafgarland/typescript-vim', {'for': ['ts', 'typescript']}

"" javascript
" Plug 'pangloss/vim-javascript', {'for': ['js', 'javascript']}
" Plug 'jelera/vim-javascript-syntax', {'for': ['js', 'javascript']}
" Plug 'mhartington/nvim-typescript' " Using typescript-vim instead

"" JSX
Plug 'mxw/vim-jsx', {'for': ['jsx']}

"" JSON
" Plug 'elzr/vim-json', {'for': ['jsx', 'js', 'javascript', 'json']}

"" Python
Plug 'davidhalter/jedi-vim', {'for': ['py', 'python']}

"*****************************************************************************
"" Autocompletion
"*****************************************************************************
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"" Use Local Eslint
Plug 'benjie/neomake-local-eslint.vim'

"" Go
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': ['go', 'golang']}

""Python
Plug 'zchee/deoplete-jedi', {'for': ['py', 'python']}

"" Javascript
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', {'for': ['js', 'jsx', 'javascript']}
"*****************************************************************************

"" File Icons (should load last, works bettet this way)
Plug 'ryanoasis/vim-devicons'
"*****************************************************************************
"*****************************************************************************
call plug#end()

"" Required
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set relativenumber

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
    " colorscheme molokai
    " colorscheme tender
    colorscheme nova
    " colorscheme Tomorrow-Night
endif

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
    let g:CSApprox_loaded = 1

    " IndentLine
    let g:indentLine_enabled = 1
    let g:indentLine_concealcursor = 0
    let g:indentLine_char = '┆'
    let g:indentLine_faster = 1
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

set wrap
set wm=2
set textwidth=79

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F
set autoread

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}

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

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END


augroup vue-file-options
    autocmd!
    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" Vim-Javascript
augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
augroup END

"" Vim-Python
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
        \ formatoptions+=croq softtabstop=4 smartindent
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

"" Auto format javascript with standard
augroup standard-auto-format
    autocmd!
    autocmd BufWritePost *.js silent !standard --fix %
augroup END
set autoread

"" Use Neomake on every Write
augroup neomake-linting
    autocmd!
    autocmd BufWritePost * Neomake
augroup END
"" Show info if needed
let g:neomake_open_list = 2

"" vim-go
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
augroup END

"" For HTML files, 2 spaces
augroup html-file-option
    autocmd!
    autocmd Filetype html setlocal ts=2 sw=2 expandtab
augroup END

augroup vue-file-option-tabs
    autocmd!
    autocmd Filetype vue setlocal ts=2 sw=2 expandtab
augroup END

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Git
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

"" Terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

"" Split
noremap <Leader>v :<C-u>split<CR>
noremap <Leader>h :<C-u>vsplit<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Tabs
nnoremap <Tab> gt
" nnoremap <S-Tab> gT (Shit + Tab Allready used by Reverse indenting)
nnoremap <silent> <S-t> :tabnew<CR>

"" Close Current tab
noremap <leader>c :tabclose<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>C :bd<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
"
"" Clipboard shortcuts
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Move selected lines up / down  one line
nnoremap <Leader><Up>   :<C-u>silent! move-2<CR>==
nnoremap <Leader><Down> :<C-u>silent! move+<CR>==
xnoremap <Leader><Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <Leader><Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv

"" reverse indent for command mode
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>

"" NERDTree
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <leader><F2> :NERDTreeTabsFind<CR>
noremap <F3> :NERDTreeToggle<CR>
noremap <leader><F3> :NERDTreeTabsToggle<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************
"" Tagbar configuration
let g:tagbar_autofocus = 1

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"" NeoSnippet
"" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

"" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'
" let g:syntastic_style_error_symbol = '✗'
" let g:syntastic_style_warning_symbol = '⚠'
" let g:syntastic_auto_loc_list=1
" let g:syntastic_aggregate_errors = 1

" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_javascript_checkers = ['eslint', 'tern']

"" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

"" Use ternjs (javascript)
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"" Add extra filetypes to ternjs for javascript
let g:tern#filetypes = [
    \ 'jsx',
    \ 'javascript.jsx',
    \ 'javascript',
    \ 'vue'
    \ ]

"" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
    \ 'tern#Complete',
    \ 'jspc#omni'
    \ ]

"" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

"" GoLang
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

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"" Automaticually imports/remove packages
let g:go_fmt_command = "goimports"

" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

"" Javascript
let g:javascript_enable_domhtmlcss = 1

"" Javascript Makers (NeoMake)
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_jsx_enabled_makers = ['eslint', 'standard']

"" JSX
let g:jsx_ext_required = 1

"" Python Jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

"" Syntastic
" let g:syntastic_python_checkers=['pylint', 'python', 'flake8']

"*******************************************************************************************
"" Lightline
"*******************************************************************************************
let g:lightline = {
    \ 'colorscheme': 'PaperColor',
    \   'active': {
    \       'left': [ ['mode', 'paste'], ['fugitive', 'filename'], ['neomake', 'gitgutter'] ],
    \       'right': [ ['percent', 'lineinfo'], ['fileformat', 'fileencoding', 'filetype'] ]
    \   },
    \   'component_function': {
    \       'fugitive': 'LightlineFugitive',
    \       'readonly': 'LightlineReadonly',
    \       'modified': 'LightlineModified',
    \       'filename': 'LightlineFilename',
    \       'fileformat': 'LightlineFileformat',
    \       'filetype': 'LightlineFiletype',
    \       'fileencoding': 'LightlineFileencoding'
    \   },
    \   'component_expand': {
    \       'gitgutter': 'LightlineGitGutter',
    \       'neomake':  'LightlineNeomake'
    \   },
    \   'component_type': {
    \       'gitgutter': 'warning',
    \       'neomake': 'warning'
    \   }
    \}

"" Will show whether or not the file has been modified
function! LightlineModified()
    return winwidth(0) > 70 ? (&ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-') : ''
endfunction

"" Will show whether it is read only or not
function! LightlineReadonly()
    return winwidth(0) > 70 ? (&ft !~? 'help' && &readonly ? '⭤' : '') : ''
endfunction

"" Will Show Git Status
function! LightlineFugitive()
    if exists("*fugitive#head") && winwidth(0) > 70
        let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
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

"" Will Show whether there are any linting erros (NeoMake)
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
        return 'Errors: ' . total
    else
        return ''
    endif
endfunction

"" Will Show if there has been any changes compared with git
function! LightlineGitGutter()
    if winwidth(0) > 70
        if ! exists('*GitGutterGetHunkSummary')
            \ || ! get(g:, 'gitgutter_enabled', 0)
            \ || winwidth('.') <= 90
            return ''
        endif

        let symbols = [
            \ g:gitgutter_sign_added . ' ',
            \ g:gitgutter_sign_modified . ' ',
            \ g:gitgutter_sign_removed . ' '
            \ ]

        let hunks = GitGutterGetHunkSummary()
        let ret = []
        for i in [0, 1, 2]
            if hunks[i] > 0
                call add(ret, symbols[i] . hunks[i])
            endif
        endfor

        if len(ret[0]) > 0
            return 'gitgutter: ' . join(ret, ' ')
        endif
    endif
    return ''
endfunction

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

