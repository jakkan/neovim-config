-- Improved terminal inside neovim

local M = {
  "akinsho/toggleterm.nvim"
}

function M.config()
  require("toggleterm").setup{
    open_mapping = [[<c-\>]],
    direction = "float",
    float_opts = {
      highlights = {
        border = "Normal",
        background = "Normal",
      },
      border = "curved",
    },
  }

  -- Better navigation to and from terminal
  local set_terminal_keymaps = function()
    local opts = { noremap = true }
    local buf_map = vim.api.nvim_buf_set_keymap
    -- buf_map(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    buf_map(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    buf_map(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    buf_map(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    buf_map(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    buf_map(0, "t", "<C-left>", [[<C-\><C-n><C-W>h]], opts)
    buf_map(0, "t", "<C-down>", [[<C-\><C-n><C-W>j]], opts)
    buf_map(0, "t", "<C-up>", [[<C-\><C-n><C-W>k]], opts)
    buf_map(0, "t", "<C-right>", [[<C-\><C-n><C-W>l]], opts)
  end
  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*",
    callback = function()
      set_terminal_keymaps()
    end,
    desc = "Mappings for navigation with a terminal",
  })
end

return M
