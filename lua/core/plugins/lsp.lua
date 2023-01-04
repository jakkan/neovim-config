-- LSP Configuration & Plugins
local M = {
  'neovim/nvim-lspconfig',
  event = "BufReadPre",
  dependencies = {
    -- Automatically install LSP servers, DAP servers, linters, formatters
    'williamboman/mason.nvim',
    -- Recommended when using mason together with LSP, bridges the gap
    'williamboman/mason-lspconfig.nvim',
    -- Useful status updates for LSP
    'j-hui/fidget.nvim',
    -- Additional lua configuration
    'folke/neodev.nvim',
    -- Integration
    "hrsh7th/cmp-nvim-lsp",
    -- Integration
    'kevinhwang91/nvim-ufo',
  },
}

function M.config()
  require("mason").setup()
  local u = require("core/utils")

  -- Customizing how diagnostics are displayed, source: https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/lsp/lspconfig.lua 
  vim.diagnostic.config({
    update_in_insert = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  -- diagnostic (l)
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  u.bind(u.normal, "Show diagnostics in a floating window (#lsp)", "<space>ll", vim.diagnostic.open_float, opts)
  u.bind(u.normal, "Goto next diagnostic (#lsp)", "<leader>ln", vim.diagnostic.goto_next, opts)
  u.bind(u.normal, "Goto previous diagnostic (#lsp)", "<leader>lp", vim.diagnostic.goto_prev, opts)
  u.bind(u.normal, "Show diagnostics list in location list (#lsp)", "<leader>lq", vim.diagnostic.setloclist, opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- lsp (l)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    u.bind(u.normal, "Jump to definition (#lsp)", {"<leader>ld", "gd"}, vim.lsp.buf.definition, bufopts)
    u.bind(u.normal, "Jump to declaration (#lsp)", {"<leader>lD", "gD"}, vim.lsp.buf.declaration, bufopts)
    u.bind(u.normal, "Jump to type definition (#lsp)", "<leader>lt", vim.lsp.buf.type_definition, bufopts)
    u.bind(u.normal, "Show implementations list in quickfix window (#lsp)", {"<leader>li", "gi"}, vim.lsp.buf.implementation, bufopts)
    u.bind(u.normal, "Show references in the quickfix window (#lsp)", {"<leader>lr", "gr"}, vim.lsp.buf.references, bufopts)
    u.bind(u.normal, "Show signature help in floating window (#lsp)", {"<leader>lk", "<C-k>"}, vim.lsp.buf.signature_help, bufopts)
    u.bind(u.normal, "Show hover information in floating window (#lsp)", "<leader>lK", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "K", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end)
    u.bind(u.normal, "Rename buffer (#lsp)", "<leader>lR", vim.lsp.buf.rename, bufopts)
    u.bind(u.normal, "Select code action (#lsp)", "<leader>la", vim.lsp.buf.code_action, bufopts)
    u.bind(u.normal, "Format buffer (#lsp)", "<leader>lf", function() vim.lsp.buf.format { async = true } end, bufopts)

    -- workspace
    u.bind(u.normal, "Add buffer location as workspace folder (lsp)", "<leader>lw", vim.lsp.buf.add_workspace_folder, bufopts)
    u.bind(u.normal, "Remove buffer location as workspace folder (lsp)", "<leader>lW", vim.lsp.buf.remove_workspace_folder, bufopts)
    u.bind(u.normal, "List workspace folders (lsp)", "<leader>lL", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    u.bind(u.normal, "Show workspace diagnostics in Telescope (lsp)", "<leader>lQ", "<cmd>Telescope diagnostics<cr>", bufopts)
  end

  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  -- Neovim hasn't added foldingRange to default capabilities, users must add it manually, source: https://github.com/kevinhwang91/nvim-ufo
  capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
  }

  local mason_lspconfig = require("mason-lspconfig")

  local servers = {
    astro = {},
    bashls = {},
    cssls = {},
    dockerls = {},
    eslint = {},
    graphql = {},
    html = {},
    jsonls = {
      on_new_config = function(new_config)
        new_config.settings.json.schemas = new_config.settings.json.schemas or {}
        vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
      end,
      settings = {
        json = {
          format = {
            enable = true,
          },
          validate = { enable = true },
        },
      },
    },
    tsserver = {},
    marksman = {},
    pyright = {},
    tailwindcss = {},
    yamlls = {},
    sumneko_lua = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        diagnostics = {
          -- Get the language server to recognize the `vim` global.
          globals = { 'vim', 'require' },
        },
      },
    },
  }

  -- Setup neovim lua configuration
  require('neodev').setup()

  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
  }

  local lspconfig = require("lspconfig")

  mason_lspconfig.setup_handlers {
      -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
    function (server_name)
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = servers[server_name],
      }
    end,
  }

  -- Turn on lsp status information
  require('fidget').setup()
end

return M
