--[[
  Which-Key
  Este plugin exibe um popup com as teclas possíveis assim que você começa a digitar um atalho.
  É excelente para descobrir e lembrar atalhos disponíveis.
]]
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- Configuração da Janela (Tema)
        window = {
            border = "rounded", -- Borda arredondada (mais bonito)
            position = "bottom", -- Aparece no rodapé
            margin = { 1, 0, 1, 0 }, -- Margem extra
            padding = { 2, 2, 2, 2 }, -- Espaçamento interno
            winblend = 0, -- Opacidade (0 = sólido, 100 = invisível)
        },
        layout = {
            height = { min = 4, max = 25 }, 
            width = { min = 20, max = 50 }, 
            spacing = 5, -- Espaço entre colunas
            align = "center", -- Alinhamento do texto
        },
        -- Ícones e Cores
        icons = {
            breadcrumb = "»", -- Seta de navegação
            separator = "➜", -- Separador entre tecla e descrição
            group = "+", -- Indicador de grupo
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        -- Tradução dos Grupos de Teclas para Português
        -- Isso dá nome aos prefixos (ex: quando você aperta <espaço>, ele mostra essas categorias)
        wk.register({
            ["<leader>f"] = { name = "📂 Arquivos" },
            ["<leader>w"] = { name = "🔍 Pesquisar (Projeto)" },
            ["<leader>t"] = { name = "🎨 Temas e Opções" },
            ["<leader>e"] = { name = "🌴 Explorador de Arquivos" },
            ["<leader>c"] = { name = "💻 Código / LSP" },
            ["<leader>?"] = { name = "❓ Ajuda" },
        })
    end,
}
