-- helpers --
local nexec = vim.api.nvim_exec

--Remap escape to leave terminal mode
nexec([[
augroup Terminal
  autocmd!
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au TermOpen * set nonu
augroup end
]], false)

nexec([[
augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
augroup end
]], false)

nexec([[
augroup Packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]], false)

-- The PC is fast enough, do syntax highlight syncing from start
nexec([[
augroup Vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup end
  ]], false)

-- Remember cursor position
nexec([[
augroup Vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup end
]], false)
