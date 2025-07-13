-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options here
--vim.opt.clipboard = "unnamedplus"
-- In ~/.config/nvim/lua/config/options.lua or a similar file
-- Removing the trailing space "--"
vim.opt.list = false
-- Disable all the animations
vim.g.snacks_animate = false
-- Disable the autoformatting
vim.g.autoformat = false
-- Disable Image Sixel
vim.g.disable_sixel = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
-- Change all the cursor line (visual, insert and normal) into "block"
vim.opt.guicursor = "n-v-c-i-ci-ve-r-cr-o:block"
