return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      -- Disable the lightbulb in the sign column
      lightbulb = {
        enable = false,
        sign = false,
        virtual_text = false,
      },
      -- UI settings to minimize visual disturbances
      ui = {
        border = "rounded",
        winblend = 0, -- Disable transparency blending to prevent animation effects
        -- Disable animated transitions for borders
        expand = "",
        collapse = "",
        code_action = "💡",
        incoming = " ",
        outgoing = " ",
        hover = "📝",
      },
      -- Code action settings
      code_action = {
        show_server_name = false,
        extend_gitsigns = false,
      },
      -- Diagnostic settings
      diagnostic = {
        show_code_action = true,
        jump_num_shortcut = true,
        extend_relatedInformation = false,
      },
      -- Hover settings to prevent focus stealing
      hover = {
        max_width = 0.6,
        max_height = 0.4,
        open_link = "gx",
      },
      -- Finder settings (for Lspsaga finder)
      finder = {
        max_height = 0.5,
        max_width = 0.7,
        default = "def+ref+imp",
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
