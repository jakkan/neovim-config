local u = require("core/utils")

-- Leader key needs to be setup prior to Lazy setup
u.bind("", "", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- Lazy merges exports from "core.plugins"
require("lazy").setup("core.plugins", {
  install = {
    missing = true
  },
  change_detection = {
    enabled = false
  },
  debug = false
})
