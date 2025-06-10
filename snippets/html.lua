local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("html", {
	s("a-blank", {
		t('<a href="'),
		i(1, ""),
		t('" target="_blank" rel="noopener noreferrer">'),
		i(2, ""),
		t("</a>"),
	}),
})

-- Friendly snippets has a "command" snippet so
-- I chose the name accordinly.
ls.add_snippets("html", {
	s("com", {
		t("<!-- "),
		i(1, ""),
		t(" -->"),
	}),
})
