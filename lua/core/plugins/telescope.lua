local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- integration with telescope
    "andymass/vim-matchup",
    -- integration with telescope
    "folke/trouble.nvim",
    -- nvim native fzf extension
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
}

function M.config()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local trouble_provider = require("trouble.providers.telescope")
  telescope.setup({
    pickers = {
      find_files = {
        hidden = true,
      },
    },
    live_grep = {
      --@usage don't include the filename in the search results
      only_sort_text = true,
      theme = "dropdown",
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
    -- source: https://github.com/folke/trouble.nvim
    defaults = {
      mappings = {
        i = {
          -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
          -- Close on first esc instead of going to normal mode
          ["<esc>"] = actions.close,
          -- Trouble integration
          ["<c-t>"] = trouble_provider.open_with_trouble,
        },
        n = {
          -- Trouble integration
          ["<c-t>"] = trouble_provider.open_with_trouble,
        },
      },
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },
  })
  -- source: https://github.com/nvim-telescope/telescope-fzf-native.nvim
  require("telescope").load_extension("fzf")
end

return M
