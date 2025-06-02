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

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {},
    },
    { "goolord/alpha-nvim", enabled = false },
    { import = "plugins" },
    { import = "plugins.rose-pine" },
    { import = "plugins.lspsaga" },
    { import = "plugins.disable-lightbulb" },
    { import = "plugins.indent-blankline" },
  },
  defaults = { lazy = false, version = false },
  install = {},
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
-- vim.api.nvim_set_hl(0, "Cmdline", { fg = "#D8D8D8" })
-- vim.api.nvim_set_hl(0, "MsgArea", { fg = "#D8D8D8" })
