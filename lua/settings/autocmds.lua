-- Grouping some autocmd
-- A bunch of them are also in lsp.lua

-- Fix cmdheight = 0 completely hiding macro recording
-- status
vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		vim.opt.cmdheight = 1
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		vim.opt.cmdheight = 0
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.fn.setreg("/", "")
	end,
})

-- Enable line numbers only for netrw:
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.opt_local.number = true
		--vim.opt_local.relativenumber = false
	end,
})
