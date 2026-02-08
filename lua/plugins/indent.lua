--[[
  Indent Blankline
  Adiciona linhas verticais para indicar os níveis de indentação do código.
  Ajuda visualmente a entender a estrutura de loops, funções e condicionais.
]]
return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        indent = { char = "┊" }, -- Caractere usado para a linha de indentação
    },
}
