
-- File tree explorer
local M = {
  'nvim-tree/nvim-tree.lua',
}

local function custom_callback(callback_name)
    return string.format(":lua require('core.plugins.nvim-tree.tree-utils').%s()<CR>", callback_name)
end

function M.config()
  require("nvim-tree").setup({
    view = {
        mappings = {
            list = {
              -- search in path        
              { key = "<c-f>", cb = custom_callback "launch_find_files" },
              { key = "<c-g>", cb = custom_callback "launch_live_grep" },
            }
        }
    }
  })
end

return M
