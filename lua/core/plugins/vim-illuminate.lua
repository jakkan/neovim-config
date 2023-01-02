-- Highlight occurances of word under cursor using LSP if available, else tree-sitter, else regex

local M = {
  "RRethy/vim-illuminate",
  event = "BufReadPost",
}

return M
