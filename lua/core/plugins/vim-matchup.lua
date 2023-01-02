local M = {
  -- Supercharges %
  'andymass/vim-matchup',
  event = "BufReadPost",
}

function M.config()
  -- Not sure what this line does from docs, used in the example config in https://github.com/andymass/vim-matchup/blob/master/README.md
  vim.g.matchup_matchparen_offscreen = { method = "popup" }
end

return M
