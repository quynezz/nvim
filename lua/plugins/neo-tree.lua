return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          -- Enable relative line numbers
          vim.opt_local.relativenumber = true
          -- Enable cursorline to highlight the current line number
          vim.opt_local.cursorline = true
          vim.opt_local.cursorlineopt = "number"
        end,
      },
      -- {
      --   event = "neo_tree_buffer_leave",
      --   handler = function()
      --     -- Disable cursorline when leaving the Neo-tree buffer
      --     vim.opt_local.cursorline = false
      --   end,
      -- },
    },
  },
  init = function()
    -- Set initial highlights
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#C1C0C0", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#5f8787", bg = "NONE", bold = false })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreePrompt", { fg = "#FFFFFF", bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { fg = "#FFFFFF", bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#FFFFFF", bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#E5E5E5", bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeStatusLine", { fg = "#5f8787", bg = "NONE" })

    -- Ensure highlights persist after colorscheme changes
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#C1C0C0", bg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#5f8787", bg = "NONE", bold = false })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreePrompt", { fg = "#FFFFFF", bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { fg = "#FFFFFF", bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#FFFFFF", bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#E5E5E5", bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeStatusLine", { fg = "#5f8787", bg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      end,
    })
  end,
}
