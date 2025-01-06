-- Configurações básicas
local set = vim.opt

-- Atalhos para salvar e desfazer
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Salvar arquivo" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true, desc = "Salvar arquivo (modo insert)" })
vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true, desc = "Desfazer" })
vim.keymap.set("i", "<C-z>", "<Esc>u", { noremap = true, silent = true, desc = "Desfazer (modo insert)" })

-- Atalho para sair do Neovim
vim.keymap.set("n", "<C-q>", ":q<CR>", { noremap = true, silent = true, desc = "Sair do Neovim" })

-- Atalhos para salvar e fechar tudo
vim.keymap.set("n", "<C-S-q>", ":wa<CR>:q<CR>", { noremap = true, silent = true, desc = "Salvar e fechar tudo" })

-- Atalhos para manipular splits
vim.keymap.set("n", "<C-w>h", "<C-w>h", { noremap = true, silent = true, desc = "Mover para o split da esquerda" })
vim.keymap.set("n", "<C-w>l", "<C-w>l", { noremap = true, silent = true, desc = "Mover para o split da direita" })
vim.keymap.set("n", "<C-w>j", "<C-w>j", { noremap = true, silent = true, desc = "Mover para o split abaixo" })
vim.keymap.set("n", "<C-w>k", "<C-w>k", { noremap = true, silent = true, desc = "Mover para o split acima" })

-- Atalho para fechar o split atual
vim.keymap.set("n", "<C-w>c", "<C-w>c", { noremap = true, silent = true, desc = "Fechar o split atual" })

-- Atalho para salvar e formatar o arquivo atual
vim.keymap.set("n", "<C-f>", ":w<CR>:lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true, desc = "Salvar e formatar o arquivo atual" })

-- Configurações básicas
vim.cmd("syntax enable")
set.number = true
set.relativenumber = true
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4
set.mouse = "a"
set.clipboard = "unnamedplus"
set.termguicolors = true
set.title = true

vim.cmd([[
  filetype plugin indent on
]])

