-- Helpers --
local g = vim.g     -- Global variables
local w = vim.w     -- Window variables
local b = vim.b     -- Buffer variables
local map = vim.api.nvim_set_keymap -- Set map keys

g.mapleader = ','

-- Modes:
-- n normal
-- i insert
-- c command
-- s select
-- x visual
-- v visual and select

-- Enable spellcheck
map('n', '<Leader>sp', ':set invspell<CR>', { noremap = true, silent = false })

-- Open a terminal
map('n', '<Leader>sh', ':terminal<CR>', { noremap = true, silent = true })

-- Tabs
map('n', '<Tab>', 'gt', { noremap = true, silent = false })
map('n', '<S-t>', ':tabnew<CR>', { noremap = true, silent = true })
map('n', '<Leader>C', ':tabclose<CR>', { noremap = true, silent = false })

-- Buffers
map('n', '<Leader>z', ':bp<CR>', { noremap = true, silent = false })
map('n', '<Leader>q', ':bp<CR>', { noremap = true, silent = false })
map('n', '<Leader>x', ':bn<CR>', { noremap = true, silent = false })
map('n', '<Leader>w', ':bn<CR>', { noremap = true, silent = false })
map('n', '<Leader>c', ':bd<CR>', { noremap = true, silent = false })

-- Switch window
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })

-- Set working directory
map('n', '<Leader>.', ':lcd %:p:h<CR>', { noremap = true, silent = false })

-- Create new file in working directory
map('n', '<Leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', { noremap = true, silent = false })
map('n', '<Leader>te', ':tabe <C-R>=expand("%:p:h") . "/" <CR>', { noremap = true, silent = false })

-- Clipboard shortcuts
map('n', 'YY', '"+y<CR>', { noremap = true, silent = false })
map('n', '<Leader>p', '"+gP<CR>', { noremap = true, silent = false })
map('n', 'XX', '"+x<CR>', { noremap = true, silent = false })

-- Clear search highlight
map('n', '<Leader><Space>', ':noh<CR>', { noremap = true, silent = true })

-- Indenting in visual / select mdoe
map('v', '<', '<gv', { noremap = true, silent = false })
map('v', '>', '>gv', { noremap = true, silent = false })

-- Move visual blocks
map('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = false })
map('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = false })

-- Vim compe (Autocompletion with builtin LSP)
map('i', '<C-Space>', "compe#complete()", { noremap = true, silent = true, expr = true })
-- map('i', '<CR>', "compe#confirm('<CR>')", { noremap = true, silent = true, expr = true })
map('i', '<CR>', 'compe#confirm(\'luaeval("require \'nvim-autopairs\'.autopairs_cr()")\')', { noremap = true, silent = true, expr = true })
               -- compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
map('i', '<C-e>', "compe#close('<C-e>')", { noremap = true, silent = true, expr = true })
map('i', '<C-f>', "compe#scroll({ 'delta': +4 })", { noremap = true, silent = true, expr = true })
map('i', '<C-d>', "compe#scroll({ 'delta': -4 })", { noremap = true, silent = true, expr = true })

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Telescope fuzzy finder
map('n', '<Leader>ff', ":lua require('telescope.builtin').find_files()<CR>", { noremap = true, silent = false })
map('n', '<Leader>fb', ":lua require('telescope.builtin').buffers()<CR>", { noremap = true, silent = false })
map('n', '<Leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", { noremap = true, silent = false })
map('n', '<Leader>fh', ":lua require('telescope.builtin').help_tags()<CR>", { noremap = true, silent = false })

--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})
