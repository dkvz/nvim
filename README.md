# Neovim config
Trying out Neovim as an IDE for some time. Source controlling my config here.

The starting point was the great [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) repo.

## TODO
- Consider using [autopairs](https://github.com/windwp/nvim-autopairs) or mini-pairs (probably better)
- Telescope find file no longer ignoring what's in gitignore is kind of a problem (`.nuxt` recently came to mind)
- With [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) there's a way to conditionally enable language servers, I should use that instead of my "is_windows" big if (lsp.lua) 
- I use CamelCase for lua function names sometimes, other times not. I think people use underscores. Maybe?
