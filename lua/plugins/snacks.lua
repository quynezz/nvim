return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = false },
    dashboard = {
      preset = {},
      sections = {
        {
          -- section = "header",
          -- vim.notify(`${section = "header"}`)
        },
        -- { section = "startup", gap = 1 }, -- Show plugin load stats
        {
          text = {
            -- { "Welcome Quynezz!", align = "center", hl = "SnacksDashboardDesc" },
          },
          gap = 1,
        },
      },
    },
  },
  config = function(_, opts)
    -- Define the Base16-themed highlight group for the header
    vim.api.nvim_set_hl(0, "SnacksHeaderBase16", {
      fg = "#d8d8d8", -- base05 (light foreground for text)
      bg = "#181818", -- base00 (dark background)
      bold = true, -- Optional: make the text bold
    })

    -- Set up snacks.nvim with the provided options
    require("snacks").setup(opts)
  end,
}
