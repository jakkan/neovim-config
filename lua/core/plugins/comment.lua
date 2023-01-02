local M = {
  -- Improve gc. Add support for commenting with movements.
  'numToStr/Comment.nvim',
  dependencies = {
    -- Context based comments instead of extention based only
    "JoosepAlviste/nvim-ts-context-commentstring"
  }
}

function M.config()
  require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })
end

return M


