--[[
  Configuração de Mapeamentos de Teclas (Keymaps)
  Este arquivo centraliza todos os atalhos de teclado personalizados.
  Estão organizados por categorias para facilitar a manutenção.
]]

local map = vim.keymap.set

-- =============================================================================
-- Geral / Edição
-- =============================================================================

-- Salvar arquivo
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Salvar arquivo" })
map("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true, desc = "Salvar arquivo (modo insert)" })

-- Desfazer
map("n", "<C-z>", "u", { noremap = true, silent = true, desc = "Desfazer" })
map("i", "<C-z>", "<Esc>u", { noremap = true, silent = true, desc = "Desfazer (modo insert)" })

-- Salvar e Fechar Tudo
map("n", "<C-S-q>", ":wa<CR>:q<CR>", { noremap = true, silent = true, desc = "Salvar e fechar tudo" })

-- Sair
map("n", "<C-q>", ":q<CR>", { noremap = true, silent = true, desc = "Sair do Neovim" })

-- =============================================================================
-- Ajuda e Documentação
-- =============================================================================
-- <leader>?: Abre a lista de todos os atalhos configurados (via Telescope)
map("n", "<leader>?", ":Telescope keymaps<CR>", { desc = "Ajuda: Ver todos os atalhos" })

-- =============================================================================
-- Janelas e Navegação
-- =============================================================================

-- Mover entre janelas (splits)
map("n", "<C-w>h", "<C-w>h", { noremap = true, silent = true, desc = "Mover para o split da esquerda" })
map("n", "<C-w>l", "<C-w>l", { noremap = true, silent = true, desc = "Mover para o split da direita" })
map("n", "<C-w>j", "<C-w>j", { noremap = true, silent = true, desc = "Mover para o split abaixo" })
map("n", "<C-w>k", "<C-w>k", { noremap = true, silent = true, desc = "Mover para o split acima" })

-- Fechar split atual
map("n", "<C-w>c", "<C-w>c", { noremap = true, silent = true, desc = "Fechar o split atual" })

-- =============================================================================
-- NeoTree (Gerenciador de Arquivos)
-- =============================================================================
-- <C-Space>: Abre/Fecha o NeoTree
map("n", "<C-Space>", ":Neotree filesystem reveal left toggle<CR>", { desc = "Alternar NeoTree e revelar arquivo" })
-- <leader>e: Foca no NeoTree
map("n", "<leader>e", ":Neotree focus toggle<CR>", { desc = "Focar ou alternar NeoTree" })

-- =============================================================================
-- Telescope (Buscador Fuzzy)
-- =============================================================================
-- <leader>ff: Procura arquivos pelo nome
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Procurar arquivos" })
-- <leader>th: Troca o tema (colorscheme)
map("n", "<leader>th", ":Telescope colorscheme<CR>", { desc = "Alterar esquema de cores" })
-- <leader>fw: Procura palavras dentro do arquivo atual
map("n", "<leader>fw", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Procurar palavras no arquivo atual" })
-- <leader>wp: Procura palavras em todo o projeto (grep)
map("n", "<leader>wp", ":Telescope live_grep<CR>", { desc = "Procurar palavras no projeto" })

-- =============================================================================
-- LSP e Formatação
-- =============================================================================
-- <leader>ft: Formata o código usando o LSP configurado
map("n", "<leader>ft", vim.lsp.buf.format, { desc = "Formatar arquivo com LSP" })

-- <C-f>: Salva e formata (atalho combinado)
map("n", "<C-f>", ":w<CR>:lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true, desc = "Salvar e formatar o arquivo atual" })

-- =============================================================================
-- Buffers
-- =============================================================================
-- <Tab>: Vai para o próximo buffer
map("n", "<tab>", ":BufferLineCycleNext<CR>", { desc = "Próximo buffer" })
-- <S-Tab>: Vai para o buffer anterior
map("n", "<S-tab>", ":BufferLineCyclePrev<CR>", { desc = "Buffer anterior" })

-- =============================================================================
-- Execução de Código
-- =============================================================================
-- <A-1>: Executa arquivo Python atual
map("n", "<A-1>", ":!python3 %<CR>", { noremap = true, silent = true, desc = "Executar arquivo Python atual" })
