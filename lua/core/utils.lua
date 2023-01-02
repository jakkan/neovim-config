local M = {}

-- Declare modes
M.insert = "i"
M.normal = "n"
M.terminal = "t"
M.visual = "v"
M.visual_block = "x"
M.operator_pending = "o"
M.command = "c"
-- local command = "c"

M.bind = function(modes, desc, lhss, rhs, opts)
    local default_opts = { noremap = true, silent = true }
    local opts_with_defaults = vim.tbl_extend("force", default_opts, opts or {}, { desc = desc })
    local normalized_modes = modes
    if (type(modes) == "string") then
      normalized_modes = { modes };
    end
    local normalized_lhss = lhss
    if (type(lhss) == "string") then
      normalized_lhss = { lhss };
    end
    for _, mode_v in ipairs(normalized_modes) do
      for _, lhs_v in ipairs(normalized_lhss) do
        vim.keymap.set(mode_v, lhs_v, rhs, opts_with_defaults)
      end
    end
end

return M
