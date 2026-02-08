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
        -- Configuração simplificada (padrão já é excelente)
    },
}
