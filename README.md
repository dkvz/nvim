# Neovim config
Trying out Neovim as an IDE for some time. Source controlling my config here.

The starting point was the great [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) repo.

## Required packages

I forgot to write these down uh... From memory:

* fzf
* fd
* rg
* npm
* luarocks
* python3-venv (for basedpyright)
* C compiler, gcc is the easiest to install on Linux (see note below for Windows)
* [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md#installation)

### C compiler on Windows
On Windows, the C compiler can no longer be Zig and MSVC is extremely fickle.

The best way I found is to just download Mingw from [their releases page](https://github.com/niXman/mingw-builds-binaries/releases).

For example, the `x86_64-16.1.0-release-posix-seh-ucrt-rt_v14-rev1.7z` asset works for my Windows system, provided "gcc" and its other friends and in the PATH and there's the env variable "CC" set to "gcc".

## TODO
- Autocmd to clear search highlight when saving
- Too much stuff has changed, need to check what's up with the latest state of the kickstart repo
- Try removing lazy and use vimpack, seems to be faster than lazy loading anyways for my low amount of plugins
- Probably need to add a shortcut for [that as well](https://stackoverflow.com/questions/4465095/how-to-delete-a-buffer-in-vim-without-losing-the-split-window)
- I might no longer need the extra config for the vue LSP (it's in nvim-lspconfig I think)
- Fork friendly snippets to greatly reduce the amount of them - the HTML LSP has all the tags as well I think
    - Not a fan of a lot of the JS snippets
- With [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) there's a way to conditionally enable language servers, I should use that instead of my "is_windows" big if (lsp.lua) 
- Indent detection is sometimes wrong in html files (in mosts files I wrote using another editor)
