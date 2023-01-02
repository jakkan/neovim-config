-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('core.options')
require('core.lazy')
require('core.keymappings')
require('core.autocmd')

