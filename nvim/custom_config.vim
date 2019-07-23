"*****************************************************************************
"" Custom configs
"*****************************************************************************
" Tagbar configuration {{{
let g:tagbar_autofocus = 1
" }}}
" ALE {{{
let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_set_balloons = 1

let g:ale_go_bingo_executable = 'gopls'
let g:ale_java_eclipselsp_path = '/usr/local/bin/jdtls'

let g:ale_linter_aliases = {
\   'svelte': ['javascript']
\}
let g:ale_linters = {
\   'svelte': ['eslint'],
\   'python': ['pyls'],
\   'java': ['eclipselsp'],
\   'rust': ['rls'],
\   'vue': ['vls'],
\   'vim': ['vimt'],
\   'json': ['jsonlint'],
\   'markdown': ['alex'],
\   'go': ['gopls'],
\   'sh': ['language_server', 'shellcheck'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'rust': ['rustfmt'],
\   'svelte': ['eslint'],
\   'go': ['gofmt'],
\   'python': ['autopep8']
\}

let g:ale_linters_explicit = 0
let g:ale_rust_rls_config = {'rust': { 'clippy_preference': 'on'}}

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
" Copy/Paste/Cut Clipboard {{{
" set clipboard=unnamedplus
set clipboard^=unnamedplus
" }}}
" Ag / Ack - Make ag default for ack {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"}}}
" Rust {{{
let g:rustfmt_autosave = 1
" }}}
" Golang {{{
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
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
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
" let g:go_fmt_command = "goimports"
" let g:go_list_type = "quickfix"

" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" }}}
" Javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
" }}}
" JSX {{{
let g:jsx_ext_required = 1
" }}}
" Polyglot (Syntax) {{{
" Disable Polyglot syntax for x
let g:polyglot_disabled = ['go', 'rust']
" }}}
" Lexical {{{
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
