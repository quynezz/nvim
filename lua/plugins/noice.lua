return {
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
              Normal = "NormalFloat", -- Use NormalFloat for background consistency
              FloatBorder = "FloatBorder", -- Use FloatBorder for border consistency
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
    config = function(_, opts)
      -- Optional: Dynamically set highlights to match colorscheme
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
      require("noice").setup(opts)
    end,
  },
}
