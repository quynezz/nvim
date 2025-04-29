return {
  -- Disable nvim-lightbulb if it's installed
  {
    "kosayoda/nvim-lightbulb",
    enabled = false,
  },
  -- Disable LazyVim's code action lightbulb and related extras
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      -- Disable LazyVim extras that might add a lightbulb
      opts.extras = opts.extras or {}
      opts.extras["lsp"] = false -- Disable LSP extras that might include lightbulb
      opts.extras["ui"] = false -- Disable UI extras
      opts.lightbulb = false
      opts.code_action = {
        lightbulb = false,
      }
      return opts
    end,
  },
  -- Ensure lspsaga doesn't add a lightbulb
  {
    "nvimdev/lspsaga.nvim",
    opts = {
      lightbulb = {
        enable = false,
        sign = false,
        virtual_text = false,
      },
    },
  },
}
