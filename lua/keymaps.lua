-- Keymaps para Neovim

-- NeoTree
vim.keymap.set("n", "<C-Space>", ":Neotree filesystem reveal left toggle<CR>", { desc = "Alternar NeoTree e revelar arquivo" })
vim.keymap.set("n", "<leader>e", ":Neotree focus toggle<CR>", { desc = "Focar ou alternar NeoTree" })

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Procurar arquivos" })
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>", { desc = "Alterar esquema de cores" })
vim.keymap.set("n", "<leader>fw", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Procurar palavras no arquivo atual" })
vim.keymap.set("n", "<leader>wp", ":Telescope live_grep<CR>", { desc = "Procurar palavras no projeto" })

-- LSP e Formatação
vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, { desc = "Formatar arquivo com LSP" })

-- Navegação de Buffers
vim.keymap.set("n", "<tab>", ":BufferLineCycleNext<CR>", { desc = "Próximo buffer" })
vim.keymap.set("n", "<S-tab>", ":BufferLineCyclePrev<CR>", { desc = "Buffer anterior" })

-- Execução de Arquivos
vim.keymap.set("n", "<A-1>", ":!python3 %<CR>", { noremap = true, silent = true, desc = "Executar arquivo Python atual" })

