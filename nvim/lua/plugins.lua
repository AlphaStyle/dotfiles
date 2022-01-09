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

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Snippets
  use 'hrsh7th/vim-vsnip' 
  -- Collection of snippets
  use 'rafamadriz/friendly-snippets'
  -- Automatically install Language prosocol servers
  -- use 'kabouzeid/nvim-lspinstall'
  use 'williamboman/nvim-lsp-installer'

  -- Builtin-LSP
  use {
    'neovim/nvim-lspconfig',
    -- requires = {{'hrsh7th/vim-vsnip'}, {'kabouzeid/nvim-lspinstall'}},
    requires = {{'hrsh7th/vim-vsnip'}, {'williamboman/nvim-lsp-installer'}},
    config = function()
      local nvim_lsp = require('lspconfig')

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        --Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

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
        "clangd" 
      }

      for _, name in pairs(servers) do
        local server_is_found, server = lsp_installer.get_server(name)
        if server_is_found then
          if not server:is_installed() then
            print("Installing " .. name)
            server:install()
          end
        end
      end

      -- Register a handler that will be called for all installed servers.
      -- Alternatively, you may also register handlers on specific server instances instead (see example below).
      lsp_installer.on_server_ready(function(server)
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
            debounce_text_changes = 150,
          }
        }

        -- This setup() function is exactly the same as lspconfig's setup function.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
      end)

      -- require('lspinstall').setup() -- important
      -- local servers = require('lspinstall').installed_servers()

      -- Use a loop to conveniently call 'setup' on multiple servers and
      -- map buffer local keybindings when the language server attaches
      -- local servers = { "pylsp", "rust_analyzer", "tsserver", "gopls", "svelte", "yamlls", "jdtls", "vuels", "html", "cssls", "ccls", "clangd" }
      -- local servers = { "pyright", "rust_analyzer", "tsserver" }
      --[[ for _, lsp in ipairs(servers) do
nvim_lsp[lsp].setup({
on_attach = on_attach,
capabilities = capabilities,
flags = {
debounce_text_changes = 150,
}
})
end ]]

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

  -- AutoComplete
  use {
    'hrsh7th/nvim-compe',
    requires = 'neovim/nvim-lspconfig',
    config = function()
      require('compe').setup({
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = 'enable';
        throttle_time = 80;
        source_timeout = 200;
        resolve_timeout = 800;
        incomplete_delay = 400;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = {
          border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
          winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
          max_width = 120,
          min_width = 60,
          max_height = math.floor(vim.o.lines * 0.3),
          min_height = 1,
        };

        source = {
          path = true;
          buffer = true;
          calc = true;
          nvim_lsp = true;
          nvim_lua = true;
          vsnip = true;
          ultisnips = true;
          luasnip = true;
        };
      })
    end
  } 

  use 'p00f/nvim-ts-rainbow' -- Rainbow colored {[()]}

  -- Autopair
  use { 
    'windwp/nvim-autopairs',
    config = function() 

      require("nvim-autopairs.completion.compe").setup({
        map_cr = true, --  map <CR> on insert mode
        map_complete = true -- it will auto insert `(` after select function or method item
      })

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

--[[ use {
'iamcco/markdown-preview.nvim', 
run = 'cd app && npm install',
cmd = 'MarkdownPreview'
} ]]

  use 'editorconfig/editorconfig-vim' -- Editorconfig
  use 'lukas-reineke/indent-blankline.nvim' -- Show Indents
  use 'vim-pandoc/vim-pandoc' -- Markdown
  use 'vim-pandoc/vim-pandoc-syntax' -- Markdown
  use 'liuchengxu/vista.vim' -- instead of tagbar

  use 'joshdick/onedark.vim' -- Colorscheme
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
