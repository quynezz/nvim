vim.opt.termguicolors = true -- Enable 24-bit colors

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 0
-- vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_colorscheme = "catppuccin" -- Explicitly set catppuccin

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = { "catppuccin" },
      },
    },
    { "goolord/alpha-nvim", enabled = false },
    -- { "folke/tokyonight.nvim", enabled = false }, -- Disable tokyonight
    -- { "rebelot/kanagawa.nvim", enabled = false }, -- Disable kanagawa
    { import = "plugins" },
    { import = "plugins.catppuccin" },
    { import = "plugins.lspsaga" },
    { import = "plugins.disable-lightbulb" },
  },
  defaults = { lazy = false, version = false },
  install = {
    colorscheme = {}, -- Avoid conflicts
  },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrw",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Ensure catppuccin is applied after plugins load
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    vim.cmd("colorscheme catppuccin")
  end,
})

-- Debug colorscheme on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    print("Current colorscheme: " .. (vim.g.colors_name or "none"))
  end,
})
