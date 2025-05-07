-- ~/.config/nvim/lua/plugins/mason-lspconfig.lua

-- Mason: Package manager for LSPs, linters, and formatters
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

-- Mason-LSPConfig: Bridges Mason and nvim-lspconfig
local mason_lspconfig = {
  "williamboman/mason-lspconfig.nvim",
  event = "BufReadPre",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = {
      "solidity_ls",
      "efm",
      "bashls",
      "tsserver", -- Consider updating to "ts_ls" to match lspconfig
      "tailwindcss",
      "pyright",
      "lua_ls",
      "emmet_ls",
      "jsonls",
      "clangd",
      "dockerls",
      "gopls",
      "html",
      "cssls",
      "volar",
      "intelephense", -- Replaced phpactor with intelephense
    },
    automatic_installation = true,
  },
}

-- Mason-Tool-Installer: Installs linters and formatters
local mason_tool_installer = {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "BufReadPre",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = {
      "eslint_d",
      "prettierd",
      "luacheck",
      "stylua",
      "flake8",
      "black",
      "shellcheck",
      "shfmt",
      "hadolint",
      "cpplint",
      "clang-format",
      "gofumpt",
      "go_revive",
      "solhint",
      "fixjson",
      "stylelint",
      "php-cs-fixer", -- Kept for PHP formatting
    },
    auto_update = true,
    run_on_start = true,
  },
}

return {
  mason,
  mason_lspconfig,
  mason_tool_installer,
}
