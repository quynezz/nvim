return {
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      views = {
        cmdline_popup = {
          position = {
            row = "50%", -- Center vertically
            col = "50%", -- Center horizontally
          },
          size = {
            min_width = 60,
            width = "auto",
            height = "auto",
          },
          border = {
            style = "rounded", -- Optional: for a nicer look
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "NoiceCmdlinePopupBorder",
            },
          },
        },
      },
      presets = {
        command_palette = true, -- Ensures cmdline and popupmenu are positioned together
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- Optional for notification view
    },
  },
}
