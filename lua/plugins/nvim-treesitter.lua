--[[
  Treesitter
  Motor de destaque de sintaxe (syntax highlighting) avançado.
  Melhora significativamente as cores do código, entendendo a estrutura real da linguagem.
]]
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Define o módulo principal para setup
    opts = {
        -- Linguagens para instalar o suporte automaticamente
        ensure_installed = {
            "c", "lua", "vim", "vimdoc", "python", "javascript", "html", "java", "query", "markdown", "markdown_inline"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
