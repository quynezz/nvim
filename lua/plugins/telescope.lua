local config = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        hidden = true,
      },
      live_grep = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = { -- Note: Changed from find_buffers to buffers
        theme = "dropdown",
      },
      previewer = false,
    },
  })
end
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = config,
  keys = {
    { "<leader>fk", ":Telescope keymaps<CR>", desc = "Telescope keymaps", noremap = true, silent = true },
    { "<leader>fh", ":Telescope help_tags<CR>", desc = "Telescope help tags", noremap = true, silent = true },
    { "<leader>fm", ":Telescope find_files<CR>", desc = "Telescope find files", noremap = true, silent = true },
    { "<leader>fa", ":Telescope builtin<CR>", desc = "Telescope builtin", noremap = true, silent = true },
    { "<leader>fl", ":Telescope live_grep<CR>", desc = "Telescope live grep", noremap = true, silent = true },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "Telescope buffers", noremap = true, silent = true },
  },
}
