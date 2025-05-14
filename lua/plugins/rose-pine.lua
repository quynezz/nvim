return {
  -- Rose Pine colorscheme configuration
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "main", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },
        styles = {
          bold = true, -- Enable bold globally (required for markdownBold to apply bold styling)
          italic = false,
          transparency = true, -- Enable transparency
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        palette = {
          main = {},
          base = "NONE", -- Set background to NONE for transparency
        },

        highlight_groups = {
          Normal = { bg = "NONE" }, -- Main editor background
          NormalFloat = { bg = "NONE" }, -- Floating windows (e.g., completions, popups)
          SignColumn = { bg = "NONE" }, -- Sign column (e.g., for git signs)
          LineNr = { bg = "NONE" }, -- Line numbers
          CursorLine = { bg = "NONE" }, -- Cursor line
          CursorLineNr = { fg = "#5f8787", bg = "NONE", bold = false }, -- Cursor line number
          NeoTreeNormal = { bg = "NONE" }, -- Neo-tree main background
          NeoTreeNormalNC = { bg = "NONE" }, -- Non-active Neo-tree windows
          NeoTreeFloatNormal = { bg = "NONE" }, -- Neo-tree floating windows
          NeoTreeTitleBar = { bg = "NONE" }, -- Neo-tree title bar
          NeoTreeStatusLine = { bg = "NONE" }, -- Neo-tree status line
          NeoTreeDirectoryName = { fg = "#E5E5E5", bg = "NONE" }, -- Directory names
          NeoTreeFileName = { fg = "#FFFFFF", bg = "NONE" }, -- File names
          markdownBold = { fg = "#FFFFFF", bold = true }, -- Bold text in Markdown
        },

        before_highlight = function(group, highlight, palette)
          -- Ensure Visual group is applied
          if group == "Visual" then
            highlight.fg = "#FFFFFF"
            highlight.bg = "#D4D4D4" -- Semi-transparent purple (iris-inspired)
          end
          -- Ensure background is always NONE for key groups
          if
            group == "Normal"
            or group == "NormalFloat"
            or group == "SignColumn"
            or group == "NeoTreeNormal"
            or group == "NeoTreeDirectoryName"
            or group == "NeoTreeFileName"
            or group == "markdownBold" -- Add markdownBold to ensure no background
          then
            highlight.bg = "NONE"
          end
        end,
      })
      vim.cmd("colorscheme rose-pine")
      -- Additional enforcement of transparency after colorscheme is applied
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#E5E5E5", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#FFFFFF", bg = "NONE" })
      vim.api.nvim_set_hl(0, "markdownBold", { fg = "#FFFFFF", bg = "NONE", bold = true }) -- Enforce markdownBold color
    end,
  },
}
