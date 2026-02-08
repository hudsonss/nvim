--[[
  Lualine
  Uma barra de status (rodapé) rápida e personalizável.
  Exibe informações como modo atual (Normal/Insert), branch git, erros, e tipo de arquivo.
]]
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ícones
    config = function()
        require("lualine").setup({
            options = {
                theme = "dracula", -- O tema da barra (pode ser diferente do tema do editor)
                -- component_separators = '|',
                -- section_separators = '',
            },
        })
    end,
}
