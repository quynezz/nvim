return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        window = {
            position = "right",
        },
        event_handlers = {
            {
                event = "neo_tree_buffer_enter",
                handler = function()
                    -- Enable relative line numbers
                    vim.opt_local.relativenumber = true
                    -- Enable cursorline to highlight the current line number
                    vim.opt_local.cursorline = true
                    vim.opt_local.cursorlineopt = "both"
                end,
            },
        },
    },
    init = function()
        -- Set initial highlights
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#808080", bg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF", bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", bold = true }) -- Set cursor line to bold
        vim.api.nvim_set_hl(0, "NeoTreePrompt", { fg = "#FFFFFF", bg = "#1C2526" }) -- Non-transparent background
        vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { fg = "#FFFFFF", bg = "#1C2526" })
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#FFFFFF", bg = "#1C2526" }) -- Non-transparent background
        vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#E5E5E5", bg = "#1C2526" })
        vim.api.nvim_set_hl(0, "NeoTreeStatusLine", { fg = "#FFD700", bg = "#1C2526" })

        -- Ensure highlights persist after colorscheme changes
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = function()
                vim.api.nvim_set_hl(0, "LineNr", { fg = "#808080", bg = "NONE" })
                vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF", bg = "NONE", bold = true })
                vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", bold = true }) -- Set cursor line to bold
                vim.api.nvim_set_hl(0, "NeoTreePrompt", { fg = "#FFFFFF", bg = "#1C2526" })
                vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { fg = "#FFFFFF", bg = "#1C2526" })
                vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#FFFFFF", bg = "#1C2526" }) -- Non-transparent background
                vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#E5E5E5", bg = "#1C2526" })
                vim.api.nvim_set_hl(0, "NeoTreeStatusLine", { fg = "#FFD700", bg = "#1C2526" })
                vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
            end,
        })
    end,
}
