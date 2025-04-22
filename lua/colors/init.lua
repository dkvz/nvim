-- Legacy way to do it:
--vim.cmd([[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
--]])

function SetColorScheme(color)
	color = color or "everforest"
	-- Setting the color scheme has to happen before
	-- the transparency options.
	vim.cmd.colorscheme("everforest")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorScheme()
