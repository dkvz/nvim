local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lilypond", {
	s("versrel", {
		t({ '\\version "2.24.4"', "\\relative", "{", "\t" }),
		i(1, ""),
		t({ "", "}" }),
	}),
})
