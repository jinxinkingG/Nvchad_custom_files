local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


--disable statusline when in nvimtree and nvdash
autocmd(
  {"FileType"},
  { pattern = "nvdash",command = "set laststatus=0"}
)

autocmd(
  {"BufEnter"},
  { pattern = "*",command = "if &ft!='nvdash' && &ft!='NvimTree' | set laststatus=3 |endif"}
)

autocmd(
  {"BufEnter"},
  { pattern = "*",command = "if &ft=='nvdash' || &ft=='NvimTree' | set laststatus=0 |endif"}
)
--quit neovim when buffers only have NvimTree
autocmd("BufDelete",{
	desc = "quit nvim when no buffers",
	callback = function (args)
    print(vim.api.nvim_list_bufs()[1])
		if TableLength(vim.api.nvim_list_bufs()) == 0 then
			vim.cmd.qall()
		end
	end
})
