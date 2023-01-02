
local M = {
  -- Tree sitter, 
  'nvim-treesitter/nvim-treesitter',
  event = "BufReadPost",
  -- TSUpdate updates parsers
  build = ':TSUpdate',
  dependencies = {
    -- Additional textobjects baseed on treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- Rainbow paranthesis
    "p00f/nvim-ts-rainbow",
  },
}

function M.config()
  require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all"
    ensure_installed = { },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      -- disable = { },
      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      disable = { },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      -- recommended here: https://github.com/mickael-menu/zk-nvim
      additional_vim_regex_highlighting = { "markdown" },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<Tab>",
        scope_incremental = "<CR>",
        node_decremental = "<S-Tab>",
      },
    },
    indent = {
      enable = true,
    },
    autopairs = {
      enable = true,
    },
    matchup = {
      enable = true,
      include_match_words = true,
    },
    -- rainbow = {
    --   enable = true,
    --   extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    --   max_file_lines = 2000, -- Do not enable for files with more than specified lines
    -- },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ib"] = "@block.inner",
          ["ab"] = "@block.outer",
          ["ir"] = "@parameter.inner",
          ["ar"] = "@parameter.outer",
        },
      },
    },
    -- for nvim-ts-context-commentstring && Comment.nvim as described here: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 2000, -- Do not enable for files with more than specified lines
    },
  })
end

return M
