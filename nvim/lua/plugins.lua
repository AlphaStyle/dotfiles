-- Helpers --
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
-- cmd('packadd packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Autocompletion
  --[[ use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp

  -- Autocompletion extra
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-git'

  -- Snippets
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
 ]]
  -- Collection of snippets
  -- use 'rafamadriz/friendly-snippets'
  -- Automatically install Language prosocol servers
  -- use 'williamboman/nvim-lsp-installer'

  -- Builtin-LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/cmp-git'},
      {'hrsh7th/nvim-cmp'},

      {'hrsh7th/cmp-vsnip'},
      {'hrsh7th/vim-vsnip'},
      {'SirVer/ultisnips'},
      {'quangnguyen30192/cmp-nvim-ultisnips'},

      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},
      {'williamboman/nvim-lsp-installer'}
    },
    config = function()
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
        "bicep",
        "clangd"
      }

      require("nvim-lsp-installer").setup({
        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
      })

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

      for _, lsp in pairs(servers) do
        require('lspconfig')[lsp].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
          }
        }
      end

      -- luasnip setup
      local luasnip = require 'luasnip'

      -- nvim-cmp setup
      local cmp = require 'cmp'
      cmp.setup ({
        completion = {
          autocomplete = true,
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
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
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'vsnip' },
          { name = 'ultisnips' },
        }, {
            { name = 'buffer' },
            { name = 'path' },
            { name = 'cmdline' }
          })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
            { name = 'buffer' },
          })
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          })
      })
    end
  }

  -- use 'p00f/nvim-ts-rainbow' -- Rainbow colored {[()]}

  -- Autopair
  use {
    'windwp/nvim-autopairs',

    -- requires = {{'hrsh7th/nvim-cmp'}},
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
    -- requires = {{'p00f/nvim-ts-rainbow'}, {'windwp/nvim-autopairs'}},
    requires = {{'p00f/nvim-ts-rainbow'}},
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = "all",
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

  -- use 'kyazdani42/nvim-web-devicons' -- Icons

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      {'kyazdani42/nvim-web-devicons', opt = true},
      {'navarasu/onedark.nvim'},
    },
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

  -- Issues in Quickfix
  use {
    "folke/trouble.nvim",
    -- requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup() end
  }

  use {
    'ur4ltz/surround.nvim',
    config = function()
      require('surround').setup({ })
    end
  }

  -- use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Highlight TODO HACK FIX (FIXME) BUG, ect
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup() end
  }


  use {
    'nvim-telescope/telescope.nvim',
    -- requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {
    'lewis6991/gitsigns.nvim',
    --[[ requires = {
      'nvim-lua/plenary.nvim'
    }, ]]
    config = function() require('gitsigns').setup() end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then
    require('packer').sync()
  end
end)

