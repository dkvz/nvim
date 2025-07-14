return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		-- We could give a table to setup to disable autopairs
		-- for some filetypes.
		-- Default is this:
		-- disable_filetype = { "TelescopePrompt", "spectre_panel", "snacks_picker_input" },
		npairs.setup()
		npairs.remove_rule("`")
	end,
}
