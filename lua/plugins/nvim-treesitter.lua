local config = function()
  require("nvim-treesitter.configs").setup({
    indent = {
      enable = false,
    },
    autotag = {
      enable = true,
    },
    ensure_installed = {
      "markdown",
      "json",
      "javascript",
      "typescript",
      "yaml",
      "html",
      "css",
      "markdown",
      "bash",
      "dockerfile",
      "solidity",
      "gitignore",
      "python",
      "vue",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  })
end
--
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config,
}
