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
  local telescope_actions = require("telescope.actions")
  local trouble_telescope_provider = require("trouble.providers.telescope")

  telescope.setup({
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
    pickers = {
      find_files = {
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--glob",
          "!**/.git/*"
        },
      },
    },
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--trim", -- don't show indentation in search result
        "--glob",
        "!**/.git/*",
      },
      mappings = {
        i = {
          ["<esc>"] = telescope_actions.close,
          ["<C-e>"] = { "<esc>", type = "command" },
          ["<c-t>"] = trouble_telescope_provider.open_with_trouble,
        },
        n = {
          ["<c-t>"] = trouble_telescope_provider.open_with_trouble,
        },
      },
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },
  })
  -- source: https://github.com/nvim-telescope/telescope-fzf-native.nvim
  require("telescope").load_extension("fzf")
end

return M
