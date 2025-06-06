local mapkey = require("util.keymapper").mapkey

local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
  mapkey("<leader>fd", "Lspsaga finder", "n", opts) -- go to definition
  mapkey("<leader>gd", "Lspsaga peek_definition", "n", opts) -- peak definition
  mapkey("<leader>gD", "Lspsaga goto_definition", "n", opts) -- go to definition
  mapkey("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
  mapkey("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
  mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts) -- show  diagnostics for line
  mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
  mapkey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
  mapkey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer
  mapkey("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor

  if client.name == "pyright" then
    mapkey("<Leader>oi", "PyrightOrganizeImports", "n", opts)
  end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }
return M
