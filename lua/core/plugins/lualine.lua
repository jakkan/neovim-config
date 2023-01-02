-- Improved status line

local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  }
}

function M.config()
  require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = 'catppuccin',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = false,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'diff'}, --{'branch', 'diff', 'diagnostics'},
      lualine_c = {'diagnostics'}, --{'filename'},
      lualine_x = {'progress'}, --{'encoding', 'fileformat', 'filetype'},
      lualine_y = {'location'}, --{'progress'},
      lualine_z = {} --{'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {}, --{},
      lualine_c = {}, --{'filename'},
      lualine_x = {}, --{'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = { -- {}
      lualine_a = {},
      lualine_b = {'buffers'},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
end

return M
