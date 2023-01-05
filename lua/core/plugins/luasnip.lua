local M = {
  -- Snippet engine
  "L3MON4D3/LuaSnip",
  dependencies = {
    -- Bunch of snippets
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}

function M.config()
  local luasnip = require("luasnip")

  luasnip.add_snippets(nil, {
    markdown = {
        luasnip.snippet({
            trig = "title",
            namr = "Title",
            dscr = "Insert filename as title",
        }, {
            luasnip.function_node(function() return {vim.fn.expand("%:t:r")} end, {}),
        }),
    },

  })
  luasnip.config.setup({
    history = true,
    enable_autosnippets = true,
    -- Update more often, :h events for more info.
    -- updateevents = "TextChanged,TextChangedI",
  })

end

return M

