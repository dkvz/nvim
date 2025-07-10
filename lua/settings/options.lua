-- Options mostly recycled from my vimrc
vim.opt.linebreak = true
vim.g.netrw_liststyle = 3
--vim.g.netrw_winsize = 30
-- Supposed to make splits always equal in size:
vim.opt.equalalways = true
-- My old indent settings (sorry)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
-- Treesitter is supposed to do the indentation
-- Hopefully
--vim.opt.smartindent = true

-- Enable line numbers only for netrw:
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.opt_local.number = true
		--vim.opt_local.relativenumber = false
	end,
})
