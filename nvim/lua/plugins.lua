-- Helpers --
local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Ensure that packer is installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

-- Only required if you have packer configured as `opt`
cmd('packadd packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "neovim/nvim-lspconfig"

  -- LSP installer
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }

  -- Auto completion
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
  }

  -- For vsnip
  use {
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }

  -- For luasnip users.
  use {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  }

  -- For ultisnips users.
  use {
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',
  }

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
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

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
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

  -- lua_ls",
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
    "jsonls",
    "marksman",
    "terraformls",
    "yamlls",
    "taplo",
    "sqlls",
    "puppet",
    "spectral",
    "dockerls",
    "bashls",
    "clangd"
  }

  require("mason").setup()
  require("mason-lspconfig").setup {
    ensure_installed = servers,
    automatic_installation = true,
  }

  for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {}
  end

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })

  -- Autopair
  use {
    'windwp/nvim-autopairs',

    requires = { { 'hrsh7th/nvim-cmp' } },
    config = function()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

      -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
      -- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

      local npairs = require("nvim-autopairs")

      npairs.setup({
        check_ts = true,
        ts_config = {
          lua = { 'string' }, -- it will not add pair on that treesitter node
          javascript = { 'template_string' },
          java = false, -- don't check treesitter on java
        },
      })

      local ts_conds = require('nvim-autopairs.ts-conds')
      local Rule = require('nvim-autopairs.rule')

      -- press % => %% is only inside comment or string
      npairs.add_rules({
        Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
        Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ 'function' }))
      })
    end
  }

  use 'HiPhish/nvim-ts-rainbow2'

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = { { 'windwp/nvim-autopairs' } },
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
          -- list of languages you want to disable the plugin for
          -- disable = { 'jsx', 'cpp' },
          -- Which query to use for finding delimiters
          query = 'rainbow-parens',
          -- Highlight the entire buffer all at once
          strategy = require('ts-rainbow').strategy.global,
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
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
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

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

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
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  }
end)
