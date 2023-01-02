local o = vim.opt

-- Have persistent undo per buffer, writes undo files
o.undofile = true
-- Creates swap file with unsaved buffer changes. Can help against inadvertedly modifying the same buffer in multiple windows. Can help with restoring changes after crash. For me swap file warnings waste my time and I want to be able to open the same file in multiple buffers.
o.swapfile = false
-- Make backup file prior to saving. 
o.writebackup = false
-- Do not remove backup file after successful save (only used when writebackup is on).
o.backup = false
-- Hide buffers with unsaved changes instead of closing them, used by toggleterm to preserve state.
o.hidden = true

-- Allow the mouse to be used
o.mouse = "a"

-- Operations which would normally use the unnamed registry use the system clipboard (*) instead.
o.clipboard = "unnamedplus"

-- Popup menu height.
o.pumheight = 10
-- Use the same menu when one or more options, don't select any option by default, don't insert until user selects.
o.completeopt = { "menu", "menuone", "noselect", "noinsert" }

-- Timout sequenced key mappings.
o.timeout = false
-- Time to wait until timeout (only used when timeout is on). WhichKey disables timout and shows panel after this time instead.
o.timeoutlen = 0
-- Time both until cursor hold from key down and until completion when nothing is typed.
o.updatetime = 100

-- highlight the current line.
o.cursorline = true

-- Show partial sequential command. WhichKey panel also shows this.
o.showcmd = true
-- I think this shows the mode on the last line in cmd. I show mode with plugins like lualine instead.
o.showmode = false
-- Use '2' to always show tabline. I think this line is used by bufferline to show buffers and tabs.
o.showtabline = 2
-- Show position of cursor. This job can also be handled by plugins like Lualine.
o.ruler = false
-- How to handle some kind of conceal syntax. Supposedly good to turn off so that `` is visible in markdown files.
o.conceallevel = 0

-- set numbered lines
o.number = true
-- set relative numbered lines.
o.relativenumber = true
-- Set number column width to 2.
o.numberwidth = 2
-- Always show the sign column, otherwise it would shift the text each time.
o.signcolumn = "yes"

-- Tab inputs are expanded to spaces.
o.expandtab = true
-- The number of spaces inserted for each indentation/tab input.
o.shiftwidth = 2
-- A line starting with a tab will appear indented this many characters.
o.tabstop = 2

-- By default new windows are created above.
o.splitbelow = true
-- By default new windows are created to the left.
o.splitright = true

-- Minumum visible lines above/under cursor.
o.scrolloff = 4
-- Minimum visible lines left/right of cursor.
o.sidescrolloff = 8

-- Experenting with fold settings for ufo
o.foldcolumn = '1'
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Ignore case in search patterns
o.ignorecase = true
-- Ignore case only if only lower case is used (only used when ignorecase is on)
o.smartcase = true
-- highlight all matches on previous search pattern
o.hlsearch = true

-- Display long lines without wrapping
o.wrap = false
-- Wrapped lines continue with the same indent
o.breakindent = true

-- Words from these languages are recognized when spell checking
o.spelllang = { "en" }

-- Use "gui" colors instead of "cterm" colors in TUI. Requries terminal compatible with some ISO, most terminals are.
o.termguicolors = true

-- The encoding written to a file.
o.fileencoding = "utf-8"

-- Apparently used to get rid of some redundant messages
o.shortmess = o.shortmess + "c"
-- Get rid of intro message when starting vim. Something is causing it to flicker and dissapear anyway and I don't need it.
o.shortmess = o.shortmess + "I"

-- This left/right cursor keys to move to the previous/next line after reacking first/last character of line.
vim.cmd "set whichwrap+=<,>,[,],h,l"

