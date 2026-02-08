--[[ 
  Configuração de Opções (Options)
  Este arquivo contém todas as opções globais do Neovim.
  Ele define comportamentos como numeração de linhas, tabulação, clipboard, e cores.
]]

local set = vim.opt

-- Habilita o destaque de sintaxe
vim.cmd("syntax enable")

-- Exibe números de linha
set.number = true

-- Usa números relativos (útil para navegação com j/k)
set.relativenumber = true

-- Converte tabs em espaços
set.expandtab = true

-- Número de espaços que um <Tab> conta
set.tabstop = 4

-- Tamanho da indentação para cada passo de (auto)indent
set.shiftwidth = 4

-- Habilita o uso do mouse em todos os modos ('a' = all)
set.mouse = "a"

-- Sincroniza o clipboard do Neovim com o do sistema operacional
set.clipboard = "unnamedplus"

-- Habilita cores de 24-bits (necessário para alguns temas)
set.termguicolors = true

-- Define o título da janela do terminal
set.title = true

-- Habilita plugins de tipo de arquivo e indentação automática
vim.cmd([[
  filetype plugin indent on
]])

-- Define a tecla líder como espaço (Global)
-- Nota: É importante definir isso antes de carregar plugins ou keymaps que usam <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "
