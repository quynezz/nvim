local opts = { noremap = true, silent = true }
local keymap = vim.keymap

keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- WINDOW MANAGEMENT
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)
keymap.set("n", "<leader>m", ":MaximizeToggle<CR>", opts)
-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comment
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Define :FormatCode command
vim.api.nvim_create_user_command("FormatCode", function()
  vim.cmd("normal! gggqG``") -- Execute gggqG`` in normal mode
  vim.notify("Done Formatting!")
end, { desc = "Format entire file and return cursor to previous position" })

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})
