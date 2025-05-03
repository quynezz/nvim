-- Install toggleterm.nvim via Lazy.nvim
return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup()
  end,
}
