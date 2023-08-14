-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
if vim.g.neovide then
  require('custom.neovide')
end

require('custom.base_config')

--load functions
require('custom.core.functions')

-- load autocmd
require('custom.core.autocmd')
