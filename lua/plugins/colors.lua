-- Legacy way to do it the transparent background:
--vim.cmd([[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
--]])

function SetColorScheme(color, dark)
	color = color or "gruvbox-material"
  dark = dark == true
	-- Setting the color scheme has to happen before
	-- the transparency options.
	--print("applying theme " .. color)
	vim.cmd.colorscheme(color)

  vim.opt.background = dark == true and "dark" or "light"
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function SetInitialColorScheme()
	-- Look for the DKVZ_THEME env variable:
	local theme_from_env = os.getenv("DKVZ_THEME")
	if theme_from_env == "" then
		theme_from_env = nil
	end
	SetColorScheme(theme_from_env, false)
end

return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		--'folke/tokyonight.nvim',
		--'sainnhe/gruvbox-material',
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
