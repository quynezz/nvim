return {
  "metalelf0/base16-black-metal-scheme",
  name = "black-metal",
  priority = 1000,
  config = function()
    -- Ensure the colorscheme is applied
    vim.cmd("colorscheme base16-black-metal")
  end,
}
