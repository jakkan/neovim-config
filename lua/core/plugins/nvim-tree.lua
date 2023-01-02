
-- File tree explorer
local M = {
  'nvim-tree/nvim-tree.lua',
}

function M.config()
  require("nvim-tree").setup()
end

return M
