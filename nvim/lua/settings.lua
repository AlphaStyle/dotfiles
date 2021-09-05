-- Helpers --
local o = vim.o     -- Global options
local wo = vim.wo   -- Window-local options
local bo = vim.bo   -- Buffer-local options
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g     -- Global variables

-- Abbreviations --
cmd('cnoreabbrev W! w!')
cmd('cnoreabbrev Q! q!')
cmd('cnoreabbrev Qall! qall!')
cmd('cnoreabbrev Wq wq')
cmd('cnoreabbrev Wa wa')
cmd('cnoreabbrev wQ wq')
cmd('cnoreabbrev WQ wq')
cmd('cnoreabbrev Wqa wqa')
cmd('cnoreabbrev WQa wqa')
cmd('cnoreabbrev WQA wqa')
cmd('cnoreabbrev W w')
cmd('cnoreabbrev Q q')
cmd('cnoreabbrev Qall qall')

-- Global variables
cmd('colorscheme onedark')
cmd('syntax on')
cmd('set clipboard^=unnamedplus')

g.netrw_browse_split = 0
g.netrw_altv = 1
g.netrw_liststyle = 3
g.netrw_list_hide = 'netrw_gitignore#Hide()'

g.surround_mappings_style = 'surround'

-- Global options
o.smartcase = true
o.guicursor = 'a:blinkon0'
o.scrolloff = 12
o.completeopt = 'menuone,noselect'
o.mouse = 'a'
o.mousemodel = 'popup'
o.path = o.path .. '**'
o.inccommand = 'nosplit'
o.hidden = true
o.showmatch = true
o.termguicolors = true
o.background = 'dark'
-- Using lualine instead
-- o.statusline = "[%{mode()}]%{get(b:,'gitsigns_status','')}%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]"
o.encoding = 'utf-8'

-- Window-local options
wo.foldmethod = 'expr'
wo.foldexpr = 'nvim_treesitter#foldexpr()'
wo.number = true
wo.relativenumber = true
wo.wrap = true -- Default on

-- Buffer-local options
bo.swapfile = false
bo.fileencoding = 'utf-8'
bo.tabstop = 2
bo.softtabstop = 2
bo.shiftwidth = 2
bo.expandtab = true
bo.autoindent = true
bo.textwidth = 100
bo.wrapmargin = 2
bo.synmaxcol = 200
