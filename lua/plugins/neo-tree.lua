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
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#C1C0C0", bg = nil })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#5f8787", bg = nil, bold = true })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = nil })
    -- Attempt to set the prompt text to white with multiple highlight groups
    vim.api.nvim_set_hl(0, "NeoTreePrompt", { fg = "#FFFFFF", bg = nil })
    vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { fg = "#FFFFFF", bg = nil })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#FFFFFF", bg = nil })
    vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#FFFFFF", bg = nil })
    -- vim.api.nvim_set_hl(0, "Normal", { fg = "#FFFFFF", bg = nil })
    -- Set the breadcrumb background to transparent
    vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#5f8787", bg = nil })
    vim.api.nvim_set_hl(0, "NeoTreeStatusLine", { fg = "#5f8787", bg = nil })

    -- Ensure the highlights persist after colorscheme changes
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#C1C0C0", bg = nil })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#5f8787", bg = nil, bold = true })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = nil })
        -- Reapply the prompt text highlights
        vim.api.nvim_set_hl(0, "NeoTreePrompt", { fg = "#FFFFFF", bg = nil })
        vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { fg = "#FFFFFF", bg = nil })
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#FFFFFF", bg = nil })
        vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#FFFFFF", bg = nil })
        -- vim.api.nvim_set_hl(0, "Normal", { fg = "#FFFFFF", bg = nil })
        -- Reapply the breadcrumb background transparency
        vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#5f8787", bg = nil })
        vim.api.nvim_set_hl(0, "NeoTreeStatusLine", { fg = "#5f8787", bg = nil })
      end,
    })
  end,
}
