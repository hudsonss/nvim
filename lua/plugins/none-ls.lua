--[[
  None-LS (antigo Null-LS)
  Permite usar ferramentas de linha de comando (como formatadores e linters) dentro do Neovim.
  Aqui configuramos o 'stylua' para formatar código Lua.
]]
return {
    "nvimtools/none-ls.nvim",

    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Formatador para Lua
                null_ls.builtins.formatting.stylua,
                -- Você pode adicionar outros formatadores aqui, ex:
                -- null_ls.builtins.formatting.black, (para python)
                -- null_ls.builtins.formatting.prettier, (para js/ts/html/css)
            },
        })
    end,
}
