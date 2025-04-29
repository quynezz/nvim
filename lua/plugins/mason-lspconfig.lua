-- ~/.config/nvim/lua/plugins/mason-lspconfig.lua
local mason = {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "BufReadPre",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}

local mason_lspconfig = {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "solidity_ls",
      "efm",
      "bashls",
      "tsserver", -- ts_ls
      "tailwindcss",
      "pyright",
      "lua_ls",
      "emmet_ls",
      "jsonls",
      "clangd",
      "dockerls",
      "gopls",
    },
    automatic_installation = true,
  },
  event = "BufReadPre",
  dependencies = { "williamboman/mason.nvim" },
}

local mason_tool_installer = {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "eslint_d", -- ESLint for JavaScript/TypeScript linting
      "prettierd", -- Prettier for formatting
      "luacheck", -- Lua linter
      "stylua", -- Lua formatter
      "flake8", -- Python linter
      "black", -- Python formatter
      "shellcheck", -- Shell script linter
      "shfmt", -- Shell script formatter
      "hadolint", -- Docker linter
      "cpplint", -- C/C++ linter
      "clang-format", -- C/C++ formatter
      "gofumpt", -- Go formatter
      "go_revive", -- Go linter
      "solhint", -- Solidity linter
      "fixjson", -- JSON formatter
    },
    auto_update = true,
    run_on_start = true,
  },
  event = "BufReadPre",
  dependencies = { "williamboman/mason.nvim" },
}

return {
  mason,
  mason_lspconfig,
  mason_tool_installer,
}
