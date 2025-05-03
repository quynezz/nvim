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
vim.g.lazyvim_colorscheme = "catppuccin" -- Use the correct colorscheme name

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = { "catppuccin" }, -- Correct colorscheme name
      },
    },
    { "goolord/alpha-nvim", enabled = false },
    { import = "plugins" },
    -- Disable catppuccin to avoid conflicts
    { import = "plugins.catppuccin" },
    { import = "plugins.lspsaga" },
    -- { import = "plugins.black-metal" },
    { import = "plugins.disable-lightbulb" },
  },
  defaults = { lazy = false, version = false },
  install = {
    colorscheme = { "catppuccin" }, -- Ensure LazyVim tries this during installation
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

-- Set initial highlights
vim.api.nvim_set_hl(0, "Cmdline", { fg = "#D8D8D8" })
vim.api.nvim_set_hl(0, "MsgArea", { fg = "#D8D8D8" })
