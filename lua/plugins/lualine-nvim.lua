local config = function()
  require("lualine").setup({
    options = {
      theme = "horizon", -- Use 'auto' to match your colorscheme
      globalstatus = true,
    },
    sections = {
      lualine_b = {
        {
          "buffers",
        },
      },
      lualine_a = {
        {
          "mode", -- Add mode to the statusline
          fmt = function(str)
            return str:upper() -- Make the mode text uppercase
          end,
        },
      },
    },
  })
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
