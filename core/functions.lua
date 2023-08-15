function TableLength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function BufIsBig(bufnr)
	local max_filesize = 100*1024
	local ok,status = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
	if ok and status and status.size > max_filesize then
		return true
	else
		return false
	end
end
