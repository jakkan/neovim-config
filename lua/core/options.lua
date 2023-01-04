-- Have persistent undo per buffer, writes undo files
vim.o.undofile = true
-- Creates swap file with unsaved buffer changes. Can help against inadvertedly modifying the same buffer in multiple windows. Can help with restoring changes after crash. For me swap file warnings waste my time and I want to be able to open the same file in multiple buffers.
vim.o.swapfile = false
-- Make backup file prior to saving. 
vim.o.writebackup = false
-- Do not remove backup file after successful save (only used when writebackup is on).
vim.o.backup = false
-- Hide buffers with unsaved changes instead of closing them, used by toggleterm to preserve state.
vim.o.hidden = true

-- Allow the mouse to be used
vim.o.mouse = "a"

-- Operations which would normally use the unnamed registry use the system clipboard (*) instead.
vim.o.clipboard = "unnamedplus"

-- Popup menu height.
vim.o.pumheight = 10
-- Use the same menu when one or more options, don't select any option by default, don't insert until user selects.
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

-- Timout sequenced key mappings.
vim.o.timeout = false
-- Time to wait until timeout (only used when timeout is on). WhichKey disables timout and shows panel after this time instead.
vim.o.timeoutlen = 0
-- Time both until cursor hold from key down and until completion when nothing is typed.
vim.o.updatetime = 100

-- highlight the current line.
vim.o.cursorline = true

-- Show partial sequential command. WhichKey panel also shows this.
vim.o.showcmd = true
-- I think this shows the mode on the last line in cmd. I show mode with plugins like lualine instead.
vim.o.showmode = false
-- Use '2' to always show tabline. I think this line is used by bufferline to show buffers and tabs.
vim.o.showtabline = 2
-- Show position of cursor. This job can also be handled by plugins like Lualine.
vim.o.ruler = false
-- How to handle some kind of conceal syntax. Supposedly good to turn off so that `` is visible in markdown files.
vim.o.conceallevel = 0

-- set numbered lines
vim.o.number = true
-- set relative numbered lines.
vim.o.relativenumber = true
-- Set number column width to 2.
vim.o.numberwidth = 2
-- Always show the sign column, otherwise it would shift the text each time.
vim.o.signcolumn = "yes"

-- Tab inputs are expanded to spaces.
vim.o.expandtab = true
-- The number of spaces inserted for each indentation/tab input.
vim.o.shiftwidth = 2
-- A line starting with a tab will appear indented this many characters.
vim.o.tabstop = 2

-- By default new windows are created above.
vim.o.splitbelow = true
-- By default new windows are created to the left.
vim.o.splitright = true

-- Minumum visible lines above/under cursor.
vim.o.scrolloff = 4
-- Minimum visible lines left/right of cursor.
vim.o.sidescrolloff = 8

-- Experenting with fold settings for ufo
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Ignore case in search patterns
vim.o.ignorecase = true
-- Ignore case only if only lower case is used (only used when ignorecase is on)
vim.o.smartcase = true
-- highlight all matches on previous search pattern
vim.o.hlsearch = true

-- Display long lines without wrapping
vim.o.wrap = false
-- Wrapped lines continue with the same indent
vim.o.breakindent = true

-- Words from these languages are recognized when spell checking
vim.opt.spelllang = { "en" }

-- Use "gui" colors instead of "cterm" colors in TUI. Requries terminal compatible with some ISO, most terminals are.
vim.o.termguicolors = true

-- The encoding written to a file.
vim.o.fileencoding = "utf-8"

-- Apparently used to get rid of some redundant messages
vim.opt.shortmess = vim.opt.shortmess + "c"
-- Get rid of intro message when starting vim. Something is causing it to flicker and dissapear anyway and I don't need it.
vim.opt.shortmess = vim.opt.shortmess + "I"

-- This left/right cursor keys to move to the previous/next line after reacking first/last character of line.
vim.cmd "set whichwrap+=<,>,[,],h,l"

