-- ~/.config/nvim/lua/plugins/lspconfig.lua
local on_attach = require("util.lsp").on_attach
local typescript_organise_imports = require("util.lsp").typescript_organise_imports
local config = function()
  -- Set LSP log level to DEBUG for detailed logging
  vim.lsp.set_log_level("DEBUG")

  require("neoconf").setup({})
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "gopls",
      "solidity_ls",
      "lua_ls",
      "jsonls",
      "pyright",
      "ts_ls",
      "bashls",
      "html",
      "cssls",
      "volar",
      "dockerls",
      -- "clangd",
      "efm",
      "intelephense",
    },
    automatic_installation = true,
  })

  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local lspconfig = require("lspconfig")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- Define diagnostic icons
  local diagnostic_icons = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN] = " ",
    [vim.diagnostic.severity.HINT] = " ",
    [vim.diagnostic.severity.INFO] = " ",
  }

  -- Configure diagnostics
  vim.diagnostic.config({
    virtual_text = {
      prefix = function(diagnostic)
        return diagnostic_icons[diagnostic.severity] or "● "
      end,
      source = false,
      spacing = 1,
      format = function(diagnostic)
        return diagnostic.message
      end,
    },
    signs = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "always",
      focusable = false,
      header = "",
      prefix = "",
      format = function(diagnostic)
        return string.format("%s (%s)", diagnostic.message, diagnostic.code or "unknown")
      end,
      severity = { min = vim.diagnostic.severity.ERROR },
    },
  })

  -- Go
  lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
  })

  -- Solidity
  lspconfig.solidity_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "solidity" },
    root_dir = lspconfig.util.root_pattern("hardhat.config.*", "foundry.toml", "remappings.txt", ".git"),
    settings = {
      solidity = {
        name = "solidity_ls",
        includePath = "",
        remappings = {
          ["@openzeppelin/"] = "lib=openzeppelin-contracts/",
          ["account-abstraction/"] = "lib=account-abstraction/",
        },
      },
    },
  })

  -- Lua
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern(".git", "stylua.toml"),
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
          enable = true,
          unusedLocal = true,
          missingFields = true,
        },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
          },
          checkThirdParty = false,
        },
      },
    },
  })

  -- JSON
  lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "json", "jsonc" },
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
    root_dir = lspconfig.util.root_pattern("package.json", ".git"),
  })

  -- Python
  lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("pyproject.toml", "setup.py", ".git"),
    settings = {
      pyright = {
        disableOrganizeImports = false,
        analysis = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          autoImportCompletions = true,
        },
      },
    },
  })

  -- PHP with Intelephense
  lspconfig.intelephense.setup({
    filetypes = { "php" },
    root_dir = function()
      return vim.fn.getcwd()
    end,
    settings = {
      intelephense = {
        diagnostics = { enable = true, undefinedVariables = true },
      },
    },
  })

  local mason_registry = require("mason-registry")
  local vue_language_server = mason_registry.get_package("vue-language-server"):get_install_path()
    .. "/node_modules/@vue/language-server"

  -- TypeScript/JavaScript
  lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "vue",
    },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git") or vim.fn.getcwd(),
    commands = {
      TypeScriptOrganizeImports = typescript_organise_imports,
    },
    settings = {
      typescript = {
        indentStyle = "space",
        indentSize = 2,
        inlayHints = {
          includeInlayParameterNameHints = "none",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayEnumMemberValueHints = false,
        },
      },
      javascript = {
        indentStyle = "space",
        indentSize = 2,
        inlayHints = {
          includeInlayParameterNameHints = "none",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayEnumMemberValueHints = false,
        },
      },
      diagnostics = {
        ignoredCodes = { 1100 },
      },
    },
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = vue_language_server,
          languages = { "vue" },
        },
      },
    },
  })

  -- Bash
  lspconfig.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "sh", "aliasrc" },
    root_dir = lspconfig.util.root_pattern(".git"),
  })

  -- HTML
  lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.notify("HTML LSP attached", vim.log.levels.INFO)
    end,
    filetypes = { "html" },
    root_dir = lspconfig.util.root_pattern("package.json", ".git") or vim.fn.getcwd(),
  })

  -- CSS
  lspconfig.cssls.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.notify("CSS LSP attached", vim.log.levels.INFO)
    end,
    filetypes = { "css", "scss", "less" },
    root_dir = lspconfig.util.root_pattern("package.json", ".git") or vim.fn.getcwd(),
  })

  -- Vue
  lspconfig.volar.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.notify("Volar LSP attached", vim.log.levels.INFO)
    end,
    filetypes = { "vue", "html" },
    root_dir = lspconfig.util.root_pattern("package.json", ".git") or vim.fn.getcwd(),
    init_options = {
      typescript = {
        tsdk = vim.fn.expand("~/.npm-global/lib/node_modules/typescript/lib"),
      },
      languageFeatures = {
        diagnostics = true,
        documentFormatting = true,
        documentRangeFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true,
        references = true,
        definition = true,
      },
    },
  })

  -- Docker
  lspconfig.dockerls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("Dockerfile", ".git"),
  })

  -- -- C/C++
  -- lspconfig.clangd.setup({
  --   capabilities = capabilities,
  --   on_attach = on_attach,
  --   cmd = {
  --     "clangd",
  --     "--offset-encoding=utf-16",
  --   },
  --   root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
  -- })
  --

  -- Set up EFM tools
  local gofumpt = require("efmls-configs.formatters.gofumpt")
  local go_revive = require("efmls-configs.linters.go_revive")
  local solhint = require("efmls-configs.linters.solhint")
  local prettier_d = require("efmls-configs.formatters.prettier_d")
  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")
  -- local flake8 = require("efmls-configs.linters.flake8")
  -- local black = require("efmls-configs.formatters.black")
  local eslint_d = require("efmls-configs.linters.eslint_d")
  local fixjson = require("efmls-configs.formatters.fixjson")
  local shellcheck = require("efmls-configs.linters.shellcheck")
  local shfmt = require("efmls-configs.formatters.shfmt")
  local hadolint = require("efmls-configs.linters.hadolint")
  local stylelint = require("efmls-configs.linters.stylelint")
  -- local cpplint = require("efmls-configs.linters.cpplint")
  -- local clangformat = require("efmls-configs.formatters.clang_format")
  local php_cs_fixer = require("efmls-configs.formatters.php_cs_fixer")

  -- Configure EFM server
  lspconfig.efm.setup({
    filetypes = {
      "solidity",
      "lua",
      "python",
      "json",
      "jsonc",
      "sh",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
      "vue",
      "markdown",
      "docker",
      "html",
      "css",
      "c",
      "cpp",
      "go",
      "php",
    },
    root_dir = lspconfig.util.root_pattern(".git", "package.json", "tsconfig.json", "jsconfig.json") or vim.fn.getcwd(),
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = false,
      documentSymbol = false,
      codeAction = false,
      completion = false,
    },
    settings = {
      rootMarkers = { ".git/", "package.json", "tsconfig.json", "jsconfig.json" },
      languages = {
        solidity = { solhint, prettier_d },
        lua = { luacheck, stylua },
        python = { flake8, black },
        json = { eslint_d, fixjson },
        jsonc = { eslint_d, fixjson },
        sh = { shellcheck, shfmt },
        javascript = { eslint_d, prettier_d },
        javascriptreact = { eslint_d, prettier_d },
        typescript = { eslint_d, prettier_d },
        typescriptreact = { eslint_d, prettier_d },
        svelte = { eslint_d, prettier_d },
        vue = { eslint_d, prettier_d },
        markdown = { prettier_d },
        docker = { hadolint, prettier_d },
        html = { prettier_d },
        css = { stylelint, prettier_d },
        -- c = { clangformat, cpplint },
        -- cpp = { clangformat, cpplint },
        go = { gofumpt, go_revive },
        php = { php_cs_fixer },
      },
    },
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true
      client.server_capabilities.diagnosticProvider = false -- Explicitly disable diagnostics in efm
      vim.notify("LSP attached filetype 🗄: " .. vim.bo.filetype, vim.log.levels.INFO)
    end,
  })
end
return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "creativenull/efmls-configs-nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "b0o/schemastore.nvim",
  },
}
