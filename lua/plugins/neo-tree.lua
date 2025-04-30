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
          -- Set LineNr to pale white with no background
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#C1C0C0", bg = nil })
          -- Set CursorLineNr to the same pale white with no background
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#5f8787", bg = nil, bold = true })
          -- Ensure CursorLine has no background (affects the entire line, not just the number)
          vim.api.nvim_set_hl(0, "CursorLine", { bg = nil })
        end,
      },
      {
        event = "neo_tree_buffer_leave",
        handler = function()
          -- Disable cursorline when leaving the Neo-tree buffer
          vim.opt_local.cursorline = false
        end,
      },
    },
  },
  init = function()
    -- Ensure the highlight persists after colorscheme changes
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#C1C0C0", bg = nil })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#5f8787", bg = nil, bold = true })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = nil })
      end,
    })
  end,
}
