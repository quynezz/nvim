return {
  "barrett-ruth/live-server.nvim",
  build = "npm install -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" }, -- Commands to lazy-load the plugin
  config = true, -- Automatically call require("live-server").setup() with default settings
}
