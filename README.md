# Neovim config
Trying out Neovim as an IDE for some time. Source controlling my config here.

The starting point was the great [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) repo.

## TODO
- I might no longer need the extra config for the vue LSP (it's in nvim-lspconfig I think)
- What's up with netrw's sort sequence and .c and .h files?
- Fork friendly snippets to greatly reduce the amount of them - the HTML LSP has all the tags as well I think
    - Not a fan of a lot of the JS snippets
- With [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) there's a way to conditionally enable language servers, I should use that instead of my "is_windows" big if (lsp.lua) 
- Indent detection is sometimes wrong in html files (in mosts files I wrote using another editor)
