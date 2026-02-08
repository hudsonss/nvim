--[[
  Auto Pairs
  Este plugin fecha automaticamente parênteses, colchetes, aspas, etc.
  Facilita a digitação de código evitando que você tenha que fechar manualmente os pares.
]]
return {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", -- recomendado fixar a versão para evitar quebras
    opts = {
        -- Configurações adicionais podem ser colocadas aqui
    },
}
