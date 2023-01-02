local M = {
  -- Change surrounding character or tags
  "kylechui/nvim-surround",
}

function M.config()
  require("nvim-surround").setup({})
end

return M
