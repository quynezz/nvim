local vim_modes = {
  n = "n",
  i = "i",
  v = "v",
}

local default_opts = {
  noremap = true,
  silent = true,
}

--- @param opts (table|nil)
--- @return table
local get_opts = function(opts)
  local all_opts = opts or {}
  for k, v in pairs(default_opts) do
    all_opts[k] = all_opts[k] or v
  end
  return all_opts
end

--- @param vimmode (string|nil)
--- @return string
local get_mode = function(vimmode)
  return vim_modes[vimmode] or "n"
end

--- @param command (string)
--- @return string
local get_cmd_string = function(command)
  return "<cmd>" .. command .. "<CR>"
end

--- @param keymaps string
--- @param command string
--- @param vimmode (string|nil)
--- @param options (table|nil)
--- @return nil
local mapkey = function(keymaps, command, vimmode, options)
  local mode = get_mode(vimmode)
  local lhs = keymaps
  local rhs = get_cmd_string(command)
  local opts = get_opts(options)
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.keymap.set("n", "<leader>O", function()
  if vim.bo.filetype == "cpp" then
    vim.cmd("write")
    local filepath = vim.fn.expand("%:p")
    local filename = vim.fn.expand("%:t:r")
    require("toggleterm").exec("g++ " .. filepath .. " -o " .. filename .. " && ./" .. filename)
  else
    vim.notify("Not a C++ file", vim.log.levels.WARN)
  end
end, { desc = "Compile and run C++ file" })

return { mapkey = mapkey }
