-- Helpers --
local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Only required if you have packer configured as `opt`
cmd('packadd packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp

  -- Snippets
  use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Collection of snippets
  use 'rafamadriz/friendly-snippets'
  -- Automatically install Language prosocol servers
  use 'williamboman/nvim-lsp-installer'

  -- Builtin-LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      {'hrsh7th/vim-vsnip'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'saadparwaiz1/cmp_luasnip'},
      {'L3MON4D3/LuaSnip'},
      {'williamboman/nvim-lsp-installer'}
    },
    config = function()
      -- local nvim_lsp = require('lspconfig')
      local opts = { noremap=true, silent=true }

      vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          'documentation',
          'detail',
          'additionalTextEdits',
        }
      }

      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

      local lsp_installer = require("nvim-lsp-installer")
      local servers = {
        "pylsp",
        "rust_analyzer",
        "tsserver",
        "gopls",
        "svelte",
        "yamlls",
        "jdtls",
        "vuels",
        "html",
        "cssls",
        "ccls",
        "sumneko_lua",
        "yamlls",
        "taplo",
        "sqlls",
        "puppet",
        "spectral",
        "dockerls",
        "bashls",
        "clangd"
      }

      -- Loop through the servers listed above and set them up. If a server is
      -- not already installed, install it.
      for _, server_name in pairs(servers) do
        local server_available, server = lsp_installer.get_server(server_name)
        if server_available then
          server:on_ready(function ()
            -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
            -- this function will be invoked. Make sure not to also use the "catch-all" lsp_installer.on_server_ready()
            -- function to set up your servers, because by doing so you'd be setting up the same server twice.
            local opts = {
              on_attach = on_attach,
              capabilities = capabilities,
              flags = {
                debounce_text_changes = 150,
              }
            }
            server:setup(opts)
          end)
          if not server:is_installed() then
            -- Queue the server to be installed.
            server:install()
          end
        end
      end

      -- luasnip setup
      local luasnip = require 'luasnip'

      -- nvim-cmp setup
      local cmp = require 'cmp'
      cmp.setup {
        completion = {
          autocomplete = true,
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'vsnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'cmdline' }
        },
      }

      function goimports(timeout_ms)
        local context = { source = { organizeImports = true } }
        vim.validate { context = { context, "t", true } }

        local params = vim.lsp.util.make_range_params()
        params.context = context

        -- See the implementation of the textDocument/codeAction callback
        -- (lua/vim/lsp/handler.lua) for how to do this properly.
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
        if not result or next(result) == nil then return end
        local actions = result[1].result
        if not actions then return end
        local action = actions[1]

        -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
        -- is a CodeAction, it can have either an edit, a command or both. Edits
        -- should be executed first.
        if action.edit or type(action.command) == "table" then
          if action.edit then
            vim.lsp.util.apply_workspace_edit(action.edit)
          end
          if type(action.command) == "table" then
            vim.lsp.buf.execute_command(action.command)
          end
        else
          vim.lsp.buf.execute_command(action)
        end
      end

      vim.cmd('autocmd BufWritePre *.go lua goimports(1000)')
    end
  }

  use 'p00f/nvim-ts-rainbow' -- Rainbow colored {[()]}

  -- Autopair
  use {
    'windwp/nvim-autopairs',

    requires = { {'hrsh7th/nvim-cmp'}},
    config = function()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

      -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
      cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

      local npairs = require("nvim-autopairs")

      npairs.setup({
        check_ts = true,
        ts_config = {
          lua = {'string'},-- it will not add pair on that treesitter node
          javascript = {'template_string'},
          java = false,-- don't check treesitter on java
        }
      })

      local ts_conds = require('nvim-autopairs.ts-conds')
      local Rule = require('nvim-autopairs.rule')

      -- press % => %% is only inside comment or string
      npairs.add_rules({
        Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({'string','comment'})),
        Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({'function'}))
      })
    end
  }

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {{'p00f/nvim-ts-rainbow'}, {'windwp/nvim-autopairs'}},
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = "maintained",
        -- ignore_install = { "javascript" },
        highlight = {
          enable = true,
          -- disable = { "c", "rust" },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        indent = {
          enable = true
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 1000,
        },
        autopairs = {
          enable = true
        }
      })
    end
  }

  use 'editorconfig/editorconfig-vim' -- Editorconfig
  use 'lukas-reineke/indent-blankline.nvim' -- Show Indents
  use 'vim-pandoc/vim-pandoc' -- Markdown
  use 'vim-pandoc/vim-pandoc-syntax' -- Markdown
  use 'liuchengxu/vista.vim' -- instead of tagbar

  -- use 'joshdick/onedark.vim' -- Colorscheme
  use {
    'navarasu/onedark.nvim',
    config = function() require('onedark').load() end
  }
  use 'b3nj5m1n/kommentary' --  Comment in / out stuff

  use 'kyazdani42/nvim-web-devicons' -- Icons

  -- Issues in Quickfix
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup() end
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup({
        options = {
          theme = 'onedark',
          section_separators = '',
          component_separators = ''
        }
      })
    end
  }

  use {
    'blackCauldron7/surround.nvim',
    config = function()
      require('surround').setup({ })
    end
  }

  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Highlight TODO HACK FIX (FIXME) BUG, ect
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup() end
  }


  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('gitsigns').setup() end
  }
end)

