--[[
  Which-Key
  Exibe sugestões de atalhos conforme o usuário digita combinações de teclas.
  Essencial para descobrir e memorizar atalhos.
]]

return {
    "folke/which-key.nvim",
    event = "VeryLazy",

    -- Opções que precisam existir antes do carregamento
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,

    ------------------------------------------------------------------
    -- Opções do plugin
    ------------------------------------------------------------------
    opts = {
        -- Configuração da janela flutuante
        win = {
            border = "rounded",
            position = "bottom",
            margin = { 1, 0, 1, 0 },
            padding = { 2, 2, 2, 2 },
            winblend = 0,
        },

        -- Layout interno
        layout = {
            height = { min = 4, max = 25 },
            width = { min = 20, max = 50 },
            spacing = 5,
            align = "center",
        },

        -- Ícones e indicadores visuais
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
        },
    },

    ------------------------------------------------------------------
    -- Configuração final
    ------------------------------------------------------------------
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        ------------------------------------------------------------------
        -- REGISTRO DE GRUPOS (API NOVA)
        -- Apenas nomeia prefixos, não cria atalhos
        ------------------------------------------------------------------
        wk.add({
            { "<leader>f", group = "📂 Arquivos" },
            { "<leader>w", group = "🔍 Pesquisar (Projeto)" },
            { "<leader>t", group = "🎨 Temas e Opções" },
            { "<leader>e", group = "🌴 Explorador de Arquivos" },
            { "<leader>c", group = "💻 Código / LSP" },
            { "<leader>?", group = "❓ Ajuda" },
        })
    end,
}
