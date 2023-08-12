-- config default shell
vim.o.shell="cmd"
-- UI config
vim.o.guifont ="DejaVuSansM Nerd Font:h14"
-- relativenumber Line number
vim.wo.relativenumber = true

-- use system clipboard
if vim.fn.has('win32') == 1 then
  vim.o.clipboard="unnamed"
else
  vim.o.clipboard="unnamedplus"
end
