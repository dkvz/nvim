-- Legacy way to do it the transparent background:
--vim.cmd([[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
--]])

local function is_linux()
	-- Repeat code also used in init.lua, should put it in some
	-- kind of util module
	return string.find(vim.loop.os_uname().sysname, "Linux") ~= nil
end

function Set_color_scheme(color, dark)
	color = color or "gruvbox-material"
	dark = dark == true
	-- Setting the color scheme has to happen before
	-- the transparency options.
	--print("applying theme " .. color)
	vim.cmd.colorscheme(color)

	vim.opt.background = dark == true and "dark" or "light"
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- BG for "non current" window, also applies to what's behind
	-- telescope when it gets opened:
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
end

function Set_initial_color_scheme()
	-- Look for the DKVZ_THEME env variable:
	local theme_from_env = os.getenv("DKVZ_THEME")
	local is_dark = true
	if theme_from_env == "" then
		theme_from_env = nil
	end
	-- When running on Linux, check if we're using
	-- the "light" theme:
	if is_linux() then
		-- If this file exists we enable the light theme:
		local f = io.open(vim.env.HOME .. "/.local/state/dkvz_colorscheme_light", "r")
		if f ~= nil then
			-- We should read the theme from the file but
			-- I spent way too much time on this thing and
			-- not on acutal code so I'll leave it as it is
			-- "shine" is a builtin theme in nvim
			-- "wildcharm" is another nice one
			theme_from_env = "shine"
			is_dark = false
			io.close(f)
		end
	end
	Set_color_scheme(theme_from_env, is_dark)
end

return {
	{
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"sainnhe/everforest",
		lazy = true,
		config = function()
			--[[require('gruvbox-material').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }--]]
			-- Disable italic comments material:
			vim.g.everforest_disable_italic_comment = 1
		end,
	},
	{
		"sainnhe/gruvbox-material",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		lazy = false,
		config = function()
			vim.g.gruvbox_material_disable_italic_comment = 1
		end,
	},
}
