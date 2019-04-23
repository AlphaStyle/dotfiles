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
" nnoremap <Leader>o :.Gbrowse<CR>
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
" nmap <leader>f :Find<CR>
" nmap <leader><leader>f :Files<CR>
" nmap <leader>b :Buffers<Space>
" nmap <leader><leader>b :Buffers<CR>
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
" vim:foldmethod=marker:foldlevel=0
