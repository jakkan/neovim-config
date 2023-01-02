-- Allow formatters and similar to hook into LSP server as additional clients
local M = {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'jay-babu/mason-null-ls.nvim'
  }
}

function M.config()
  -- source: https://github.com/jay-babu/mason-null-ls.nvim
  local mason_null_ls = require("mason-null-ls")
  local null_ls = require("null-ls")

  mason_null_ls.setup({
    ensure_installed = {
      "dockerfile",
      "hadolint",
      "prettier",
      "jq",
      "stylua",
      "markdownlint",
      "black",
      "shellcheck",
      "shfmt",
      "vint",
      "yamllint"
    },

    automatic_installation = true,

    automatic_setup = true,
  })

  null_ls.setup()

  mason_null_ls.setup_handlers({})
end

return M
