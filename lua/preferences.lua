local set = vim.opt

syntax = enable

set.number=true
set.relativenumber=true
set.expandtab=true
set.tabstop=4
set.shiftwidth=4
set.mouse=a
set.clipboard="unnamedplus"
set.termguicolors=true
set.title=true

vim.cmd([[
  filetype plugin indent on
]])
