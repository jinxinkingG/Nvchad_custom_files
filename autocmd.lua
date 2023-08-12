local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd(
  {"FileType"},
  { pattern = "nvdash", command = "set laststatus=0"}
)

autocmd(
  {"FileType"},
  { pattern = "*",command = "if &ft!='nvdash'| set laststatus=2|endif"}
)
