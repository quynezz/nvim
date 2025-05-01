return {
  "metalelf0/base16-black-metal-scheme",
  name = "black-metal",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme base16-black-metal")
    -- Brighten the comment color
    vim.api.nvim_set_hl(0, "Comment", { fg = "#AAAAAA", bg = nil, italic = true })
    vim.api.nvim_set_hl(0, "@keyword", { fg = "#5f8787", bg = nil })
    vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#a06666", bg = nil })

    -- Ensure the comment color persists after colorscheme changes
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "Comment", { fg = "#525252", bg = nil, italic = true })
        vim.api.nvim_set_hl(0, "@keyword", { fg = "#5f8787", bg = nil })
        vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#a06666", bg = nil })
      end,
    })
  end,
}
