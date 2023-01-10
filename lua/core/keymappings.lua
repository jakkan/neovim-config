local u = require("core/utils")

-----------------
-- Normal mode --
-----------------

-- Buffers (b)
u.bind(u.normal, "Switch to last active buffer (#buffers)", { "<leader>bb", "<BS>" }, ":b#<CR>")
u.bind(u.normal, "Switch to next buffer in window by number (#buffers)", { "<tab>", "<leader>b]" }, ":bnext<CR>")
u.bind(u.normal, "Switch to previous buffer in window by number (#buffers)", { "<S-tab>", "<leader>b[" }, ":bprev<CR>")
u.bind(u.normal, "Open new buffer (#buffers)", "<leader>bN", ":enew<CR>")
u.bind(u.normal, "Delete buffer (#buffers)", "<leader>bd", ":Bdelete!<CR>")
u.bind(u.normal, "Delete other buffers (#buffers)", "<leader>bD", ":%bd|e#|bd#<CR>")
u.bind(u.normal, "Find buffer (#buffers)", "<leader>bf", ":Telescope buffers<CR>")
u.bind(u.normal, "Save buffer (#buffers)", {"<leader>bs", "<C-s>"}, ":w<CR>")
u.bind(u.normal, "Symbols outline (#buffers)", {"<leader>bS"}, ":SymbolsOutline<CR>")
u.bind(u.normal, "Grep in current buffer", "<leader>bg", function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)

-- Files (f)
u.bind(u.normal, "Find files by name (#files)", "<leader>ff", ":Telescope find_files<CR>")
u.bind(u.normal, "Find files by name, including hidden files, ignored files, and symlinks (#files)", "<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true<CR>")
u.bind(u.normal, "Toggle file explorer (#files)", { "<leader>fe", "<leader>e" }, ":NvimTreeToggle<CR>")
u.bind(u.normal, "Grep file content (#files)", "<leader>fg", ":Telescope live_grep<CR>")
u.bind(u.normal, "Open recent files (#files)", "<leader>fr", ":Telescope oldfiles<CR>")

u.bind(u.normal, "Search in directory", "<leader>dg", "<cmd>Telescope dir live_grep<CR>")
u.bind(u.normal, "Pick file in directory", "<leader>df", "<cmd>Telescope dir find_files<CR>")

-- Windows (w)
u.bind(u.normal, "Split window vertically (#windows)", "<leader>wv", ":split<CR>")
u.bind(u.normal, "Split window horizontally (#windows)", "<leader>wh", ":vsplit<CR>")
u.bind(u.normal, "Focus left (#windows)", { "<leader>wl", "<C-Left>", "<C-h>" }, "<C-w>h")
u.bind(u.normal, "Focus down (#windows)", { "<leader>wd", "<C-Down>", "<C-j>" }, "<C-w>j")
u.bind(u.normal, "Focus up (#windows)", { "<leader>wu", "<C-Up>", "<C-k>" }, "<C-w>k")
u.bind(u.normal, "Focus right (#windows)", { "<leader>wr", "<C-Right>", "<C-l>" }, "<C-w>l")

-- Lines (_)
u.bind(u.normal, "Move line down (#lines)", {"<leader>_<Down>", "<leader>_h", "<A-Down>" }, ":m .+1<CR>==")
u.bind(u.normal, "Move line up (#lines)", {"<leader>_<Up>", "<leader>_j", "<A-Up>" }, ":m .-2<CR>==")

-- Edit (e)
u.bind(u.normal, "Toggle split or one-line construct (#edit)", {"<leader>ej"}, ":TSJToggle<CR>")
u.bind(u.normal, "Structural search and replace (#edit)", {"<leader>er"}, function() require("ssr").open() end)

-- Options (o)
u.bind(u.normal, "Toggle wrap (#options)", "<leader>ow", ":set wrap!<CR>")
u.bind(u.normal, "Toggle relative line numbers (#options)", "<leader>on", ":set rnu!<CR>")
u.bind(u.normal, "Toggle spell checking (#options)", "<leader>on", ":set spell!<CR>")

-- Git (g)
u.bind(u.normal, "List changed files in git status (#git, #files)", "<leader>gf", ":Telescope git_status<CR>")
u.bind(u.normal, "List branches (#git)", "<leader>gB", ":Telescope git_branches<CR>")
u.bind(u.normal, "List commits (#git)", "<leader>gc", ":Telescope git_commits<CR>")

-- Commands (c)
u.bind(u.normal, "List command history (#commands)", "<leader>ch", ":Telescope command_history<CR>")
u.bind(u.normal, "List help tags (#commands)", "<leader>ct", ":Telescope help_tags<CR>")
u.bind(u.normal, "List keymappings (#commands)", "<leader>ck", ":Telescope keymaps<CR>")
u.bind(u.normal, "List keymappings (#commands)", "<leader>cu", ":Telescope undo<CR>")

-- Quickfix (q)
u.bind(u.normal, "Toggle quickfix list (#quickfix)", "<leader>ql", "<cmd>lua require('core.utils.functions').toggle_qf()<cr>")
u.bind(u.normal, "Next quickfix item (#quickfix)", "[q", "<cmd>cnext<cr>")
u.bind(u.normal, "Previous quickfix item (#quickfix)", "]q", "<cmd>cprevious<cr>")

-- Cancel search highlighting with ESC
u.bind(u.normal, "Clear highlighting", "<esc>", ":nohlsearch<Bar>:echo<CR>")

-- Nvim-tree disables netrw which is used to execute gx, this maps a different implementation of the same functionality
u.bind(u.normal, "Open url", "gx", ":call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<CR>")

-- Popular remap for dealing with visual line wraps. I don't know what it is supposed to do.
u.bind(u.normal, "Improved down", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
u.bind(u.normal, "Improved up", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-----------------
-- Insert mode --
-----------------

-- Save
u.bind(u.insert, "Save file (#lines)", "<C-s>", "<Esc>:w<CR>a")

-- Move lines down and up
u.bind(u.insert, "Move line down (#lines)", "<A-Down>", "<Esc>:m .+1<CR>==gi")
u.bind(u.insert, "Move line up (#lines)", "<A-Up>", "<Esc>:m .-2<CR>==gi")
u.bind(u.insert, "Move line down (#lines)", "<A-j>", "<Esc>:m .+1<CR>==gi")
u.bind(u.insert, "Move line up (#lines)", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Readline-like keybindings I want to be available in every application 
u.bind(u.insert, "Jump to end of line", '<C-e>', "<Esc>$a")
u.bind(u.insert, "Jump to beginning of line", '<C-a>', "<Esc>0i")
u.bind(u.insert, "Jump word forward", '<A-f>', "<Esc>wi")
u.bind(u.insert, "Jump word backward", '<A-b>', "<Esc>bi")
u.bind(u.insert, "Delete to end of line", '<C-k>', "<Esc>ld$a")
u.bind(u.insert, "Delete to beginning of line", '<C-u>', "<C-u>") -- this one exists by default, but putting it here for sake of completeness
u.bind(u.insert, "Delete word forward", '<A-d>', "<Esc>ldwi")
u.bind(u.insert, "Delete word backward", '<A-Backspace>', "<C-w>") -- default keymapping is ctrl-w


-----------------
-- Visual mode --
-----------------

-- Better indenting
u.bind(u.visual, "Keep selection when outdenting", "<", "<gv")
u.bind(u.visual, "Keep selection when indenting", ">", ">gv")

-- Paste over text without yanking overwritten text
u.bind(u.visual, "Don't save overwritten text when pasting", "p", "_dp")
u.bind(u.visual, "Don't save overwritten text when pasting", "P", "_dP")


-------------------
-- Terminal mode --
-------------------

-- Move current line / block with Alt-j/k ala vscode.
u.bind(u.visual_block, "Move line/block down", "<A-j>", ":m '>+1<CR>gv-gv")
u.bind(u.visual_block, "Move line/block up", "<A-k>", ":m '<-2<CR>gv-gv")

