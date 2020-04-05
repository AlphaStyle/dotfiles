"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" Encoding 
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set fileformats=unix,dos,mac

" Mouse settings 
set mouse=v " Paste with middle-click on mouse
set mouse=a " Enable mouse
set mousemodel=popup

" Tabs 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start " Fix backspace indent

" Folding 
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" Faster load, render 
set lazyredraw
set noshowcmd
set autoread

" Map leader 
let mapleader=','

" Searching 
set hlsearch
set incsearch
set smartcase
set infercase
set path+=**

" Wildmenu 
set wildmenu
set wildmode=full

" bakup and swwpfiles 
set nobackup
set noswapfile

" Buffers 
set hidden " Enable hidden buffers

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
" Number, Ruler, Wrap 
let no_buffers_menu=1
syntax on
set ruler
set textwidth=100
set wrap " Wrap text
set wm=2 " Hard Wrap text
set number
set relativenumber

" Highlight matching word and line 
set showmatch " Highlight matching [{()}]
set nocursorline " (TurnOff) Highligh the line the cursor is on
set nocursorcolumn " (TurnOff)
set synmaxcol=200 " Limit syntax highlight for only the first 200 lines of code

" Color Theme 
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

" IndentLine 
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_setColors = 0
let g:indentLine_faster = 1
" let g:indentLine_setConceal = 0

" Disable the blinking cursor 
set gcr=a:blinkon0
set scrolloff=3

" Status bar 
set laststatus=2
set statusline=[%{mode()}]%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

" Use modeline overrides 
set modeline
set modelines=10

" Title 
set title
set titleold="Terminal"
set titlestring=%F

" Disable visualbell 
set noerrorbells visualbell t_vb=

" netrw settings 
" let g:netrw_
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|s\s\)\zs\.\S\+'

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have these shortcuts 
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
" Remove Trailing Whitespace On Save
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

augroup remove-white-space
    autocmd!
    autocmd BufWritePre * call StripTrailingWhitespace()
augroup END

" The PC is fast enough, do syntax highlight syncing from start 
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Remember cursor position 
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" LaTeX / LeXical / Markdown 
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,text,tex,textile,vimwiki call lexical#init({ 'spell': 1 }) |
              \  DittoOn
augroup END

" Vim-Python 
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
                \ formatoptions+=croq softtabstop=4 smartindent
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" vim-go 
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

" Vue files 
augroup vue-file-option-tabs
    autocmd!
    autocmd FileType vue setlocal relativenumber!
augroup END

