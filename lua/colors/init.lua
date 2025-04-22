-- Legacy way to do it:
--vim.cmd([[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
--]])

function SetColorScheme(color)
	color = color or "gruvbox-material"
	-- Setting the color scheme has to happen before
	-- the transparency options.
	--print("applying theme " .. color)
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Look for the DKVZ_THEME env variable:
local theme_from_env = os.getenv("DKVZ_THEME")
if theme_from_env == "" then
	theme_from_env = nil
end
SetColorScheme(theme_from_env)
