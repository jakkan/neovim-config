-- Theme

local M = {
  "catppuccin/nvim",
  name = "catppuccin",
}

function M.config()
  require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      mason = true,
      cmp = true,
      dap = {
        enabled = true,
        enable_ui = true,
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      nvimtree = true,
      treesitter = true,
      telescope = true,
      lsp_trouble = true,
      gitgutter = true,
      illuminate = true,
    }
  })

  vim.cmd [[colorscheme catppuccin]]
end

return M
