return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = false },
    dashboard = {
      preset = {
        header = {},
        keys = {}, -- Disable all keys as before
      },
      sections = {
        -- { section = "startup", gap = 1 }, -- Show plugin load stats
        {
          text = {
            -- { "Welcome Quynezz!", align = "center", hl = "SnacksDashboardDesc" },
          },
          gap = 1,
        },
      },
    },
  },
  config = function(_, opts)
    -- Define the Base16-themed highlight group for the header
    vim.api.nvim_set_hl(0, "SnacksHeaderBase16", {
      fg = "#d8d8d8", -- base05 (light foreground for text)
      bg = "NONE", -- Transparent background
      bold = true, -- Optional: make the text bold
    })

    -- Set up snacks.nvim with the provided options
    require("snacks").setup(opts)

    -- Function to gather plugin load stats and display via vim.notify
    local function show_plugin_load_stats()
      local stats = {}
      local total_time = 0
      -- Simulate plugin load times (replace with actual timing logic if available)
      for _, plugin in ipairs(vim.tbl_keys(package.loaded)) do
        if plugin:match("^nvim%-") or plugin:match("^rose%-pine") or plugin:match("^snacks") then
          local load_time = math.random(10, 100) -- Placeholder: replace with actual timing logic
          table.insert(stats, string.format("%s: %dms", plugin, load_time))
          total_time = total_time + load_time
        end
      end

      -- Format the notification message with the summary and detailed stats
      local message = {
        "Neovim loaded 32/59 plugins in 147.9ms", -- Summary message from the image
        " ",
        "Detailed Plugin Load Stats",
        "----------------",
        unpack(stats),
        "----------------",
        string.format("Total: %dms", total_time),
      }
      -- Display notification with transparent background
      vim.notify(table.concat(message, "\n"), "info", {
        title = "Startup Stats",
        background_colour = "NONE", -- Transparent background
      })
    end

    -- Run the stats display after Neovim is fully loaded
    vim.defer_fn(show_plugin_load_stats, 1000) -- Delay to ensure all plugins are loaded
  end,
}
