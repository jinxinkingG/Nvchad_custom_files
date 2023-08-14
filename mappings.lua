---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = { ":q<CR>", "quit neovim", opts = {nowait = true, silent = true} },
    ["<leader>w"] = { ":w<CR>", "save current buffer", opts = {nowait = true, silent = true} },
    ["<leader>Q"] = { ":q!<CR>", "Force quit neovim", opts = {nowait = true, silent = true} },
  },
  v = {
    q = {"<esc>","quit Visual Mode"}
  }
}

-- more keybinds!

return M
