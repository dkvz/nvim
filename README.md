# Neovim config
Trying out Neovim as an IDE for some time. Source controlling my config here.

The starting point was the great [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) repo.

## TODO
- Add a toggle for nvim-autopairs
- My html snippets should also work in vue files, is that possible?
- Fork friendly snippets to greatly reduce the amount of them - the HTML LSP has all the tags as well I think
    - Not a fan of a lot of the JS snippets
- With [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) there's a way to conditionally enable language servers, I should use that instead of my "is_windows" big if (lsp.lua) 
- I use CamelCase for lua function names sometimes, other times not. I think people use underscores. Maybe?
- Paste and Yank should also nohls
