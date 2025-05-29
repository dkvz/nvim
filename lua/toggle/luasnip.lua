-- Goal: disable all luasnip snippets with a key bind.
--
-- Sometimes I'm just writing markdown or plain text
-- and the constant autocomplete popup is annoying me.
--
-- Claude wrote most of this code so I'm a bit worried.
--

local luasnip = require("luasnip")
local luasnip_enabled = true

function Load_my_snippets()
	local config_dir = vim.fn.stdpath("config")
	require("luasnip.loaders.from_lua").load({
		paths = { config_dir .. "/snippets" },
	})
end

local function load_vendor_snippets()
	-- Friendly snippets are loaded from the config
	-- function in their dependency section and I
	-- don't want to move it around too much.
	-- This line is repeated in the config function
	-- for the snippets but hey it works.
	require("luasnip.loaders.from_vscode").lazy_load()
end

local function toggle_luasnip()
	if luasnip_enabled then
		luasnip.cleanup()
		luasnip_enabled = false
		print("LuaSnip snippets removed")
	else
		-- Reload your snippets here
		Load_my_snippets()
		load_vendor_snippets()

		luasnip_enabled = true
		print("LuaSnip snippets added back in")
	end
end

-- Create a command to toggle
vim.api.nvim_create_user_command("ToggleLuaSnip", toggle_luasnip, {})
-- Add a keybind
vim.keymap.set("n", "<leader>ts", toggle_luasnip, { desc = "Toggle LuaSnip" })
