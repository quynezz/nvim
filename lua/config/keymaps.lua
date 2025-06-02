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
    -- Save cursor position
    local cursor = vim.api.nvim_win_get_cursor(0)
    -- Set indentation settings explicitly
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    -- Format the entire file
    vim.cmd("normal! gg=G") -- Use = to reindent based on filetype
    -- Remove trailing whitespace
    vim.cmd([[%s/\s\+$//e]])
    -- Restore cursor position
    vim.api.nvim_win_set_cursor(0, cursor)
    vim.notify("Done Formatting!")
end, { desc = "Format entire file with 4-space indentation and return cursor to previous position" })

-- Remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        -- Save cursor position
        local cursor = vim.api.nvim_win_get_cursor(0)
        -- Remove trailing whitespace
        vim.cmd([[%s/\s\+$//e]])
        -- Restore cursor position
        vim.api.nvim_win_set_cursor(0, cursor)
    end,
})
