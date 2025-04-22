-- Options mostly recycled from my vimrc
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
vim.opt.background = "dark"
vim.opt.linebreak = true
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30
-- My old indent settings (sorry)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
--vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
