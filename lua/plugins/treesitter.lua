-- Copied from kickstart.nvim, was completely different
-- from what I had before.
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
	config = function()
		-- ensure basic parser are installed
		local parsers = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"javascript",
			"typescript",
			"php",
		}
		require("nvim-treesitter").install(parsers)

		---@param buf integer
		---@param language string
		local function treesitter_try_attach(buf, language)
			-- check if parser exists and load it
			if not vim.treesitter.language.add(language) then
				return
			end
			-- enables syntax highlighting and other treesitter features
			vim.treesitter.start(buf, language)

			-- enables treesitter based folds
			-- for more info on folds see `:help folds`
			-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
			-- vim.wo.foldmethod = 'expr'

			-- enables treesitter based indentation
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end

		local available_parsers = require("nvim-treesitter").get_available()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local buf, filetype = args.buf, args.match

				local language = vim.treesitter.language.get_lang(filetype)
				if not language then
					return
				end

				local installed_parsers = require("nvim-treesitter").get_installed("parsers")

				if vim.tbl_contains(installed_parsers, language) then
					-- enable the parser if it is installed
					treesitter_try_attach(buf, language)
				elseif vim.tbl_contains(available_parsers, language) then
					-- if a parser is available in `nvim-treesitter` auto install it, and enable it after the installation is done
					require("nvim-treesitter").install(language):await(function()
						treesitter_try_attach(buf, language)
					end)
				else
					-- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
					treesitter_try_attach(buf, language)
				end
			end,
		})

		-- Attempt to add tree-sitter syntax for lilypond (music notation)
		vim.api.nvim_create_autocmd("User", {
			pattern = "TSUpdate",
			callback = function()
				require("nvim-treesitter.parsers").lilypond = {
					install_info = {
						url = "https://github.com/nwhetsell/tree-sitter-lilypond",
						-- optional entries:
						generate = true, -- only needed if repo does not contain pre-generated `src/parser.c`
						location = "lilypond",
						generate_from_json = true, -- only needed if repo does not contain `src/grammar.json` either
						queries = "queries", -- also install queries from given directory
					},
				}
			end,
		})

		vim.treesitter.language.register("lilypond", { "ly" })
	end,
}
