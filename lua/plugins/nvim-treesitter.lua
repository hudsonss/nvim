--[[
  Treesitter
  Destaque de sintaxe baseado em árvore sintática (AST)
  Configuração clássica e compatível com lazy.nvim
]]

return {
    "nvim-treesitter/nvim-treesitter",

    -- Não fixa versão: releases antigas costumam causar problemas
    version = false,

    -- Atualiza os parsers após instalação/atualização
    build = ":TSUpdate",

    -- Carrega apenas quando um arquivo for aberto/criado
    event = { "BufReadPost", "BufNewFile" },

    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    ------------------------------------------------------------------
    -- opts é aplicado automaticamente como:
    -- require("nvim-treesitter.configs").setup(opts)
    ------------------------------------------------------------------
    opts = {
        ------------------------------------------------------------------
        -- Parsers que devem estar instalados
        ------------------------------------------------------------------
        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "python",
            "javascript",
            "html",
            "java",
            "query",
            "markdown",
            "markdown_inline",
        },

        ------------------------------------------------------------------
        -- Instalação assíncrona (não bloqueia o editor)
        ------------------------------------------------------------------
        sync_install = false,

        ------------------------------------------------------------------
        -- Destaque de sintaxe via Treesitter
        ------------------------------------------------------------------
        highlight = {
            enable = true,
        },

        ------------------------------------------------------------------
        -- Indentação baseada na árvore sintática
        ------------------------------------------------------------------
        indent = {
            enable = true,
        },
    },
}
