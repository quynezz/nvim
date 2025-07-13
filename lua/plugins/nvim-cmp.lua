return {
    -- Main cmp plugin
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        enabled = true,
    },
    -- Copilot integration
    {
        "github/copilot.vim",
    },
    -- Dependencies
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "rafamadriz/friendly-snippets",
        {
            "L3MON4D3/LuaSnip",
            version = "2.*",
            build = "make install_jsregexp",
        },
        "neovim/nvim-lspconfig",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        local lspconfig = require("lspconfig")

        require("luasnip/loaders/from_vscode").lazy_load()
        vim.opt.completeopt = "menu,menuone,noselect"
        lspconfig.tsserver.setup{}

        cmp.setup({
            snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
            mapping = cmp.mapping.preset.insert({
                ["<Down>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<Up>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            window = {
                documentation = {
                    border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
                    winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel",
                },
                completion = {
                    border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
                    winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel",
                },
            },
            formatting = { format = lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "..." }) },
        })

        -- Force highlight definition
        vim.cmd("highlight Pmenu guibg=#1f1f1f")
        vim.cmd(":messageshighlight PmenuBorder guifg=#ffffff guibg=#1f1f1f")
        vim.notify("cmp setup done, window: " .. vim.inspect(cmp.get_config().window), "info")
    end,
}
