local config = function()
  require("lualine").setup({
    options = {
      theme = "auto", -- Use 'auto' to match your colorscheme
      globalstatus = true,
      section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            {
                "mode", -- Add mode to the statusline
                fmt = function(str)
                    return str:upper() -- Make the mode text uppercase
                end,
            },
        },
    },
})
end

return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = config,
}
