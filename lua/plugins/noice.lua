return  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        views = {
            cmdline_popup = {},
        },
        presets = {
            command_palette = true, -- Ensures cmdline and popupmenu are positioned together
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify", -- Optional for notification view
    },
    config = function(_, opts)
        -- Optional: Dynamically set highlights to match colorscheme
        -- vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { link = "NormalFloat" })
        -- vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
        -- require("noice").setup(opts)
    end,
}
