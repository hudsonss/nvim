--[[
  Treesitter
  Motor de destaque de sintaxe (syntax highlighting) avançado.
  Melhora significativamente as cores do código, entendendo a estrutura real da linguagem.
]]
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Atualiza os parsers ao instalar/atualizar o plugin

    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            -- Linguagens para instalar o suporte automaticamente
            ensure_installed = { 
                "c", "lua", "vim", "vimdoc", "python", "javascript", "html", "java", "query", "markdown", "markdown_inline" 
            },
            sync_install = false,
            highlight = { enable = true }, -- Habilita o destaque de sintaxe
            indent = { enable = true }, -- Habilita indentação baseada na estrutura
        })
    end,
}
