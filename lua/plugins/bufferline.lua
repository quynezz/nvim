return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp", -- Show LSP diagnostics in the tabline
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "NeoTreeTitleBar",
            text_align = "center",
          },
        },
        show_buffer_close_icons = true,
        show_close_icon = true,
        separator_style = "thin", -- "slant", "thick", "thin", or { "left", "right" }
      },
      highlights = {
        buffer_selected = {
          fg = "#C4A7E7", -- Rose Pine's iris (violet) for selected buffer
          bold = true,
        },
        buffer_visible = {
          fg = "#FFFFFF", -- Default white for visible but unselected buffers
        },
        buffer = {
          fg = "#FFFFFF", -- Default white for inactive buffers
        },
        background = {
          fg = "#FFFFFF",
          bg = "NONE",
        },
        tab = {
          fg = "#FFFFFF",
          bg = "NONE",
        },
        tab_selected = {
          fg = "#C4A7E7", -- Iris for selected tab
          bg = "NONE",
        },
        separator = {
          fg = "#5f8787", -- Use rose-pine's pine color for separators
          bg = "NONE",
        },
        separator_selected = {
          fg = "#5f8787",
          bg = "NONE",
        },
        indicator_selected = {
          fg = "#C4A7E7", -- Iris for the indicator
          bg = "NONE",
        },
      },
    })
  end,
}
