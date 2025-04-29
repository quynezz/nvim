-- In ~/.config/nvim/lua/plugins/mason.lua (create this file if it doesn’t exist)
return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "BufReadPre",
  config = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
