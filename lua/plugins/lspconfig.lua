--[[
  LSP Config & Mason
  Este arquivo configura a inteligência de código (Language Server Protocol).
  Mason: Gerencia a instalação de LSPs, linters e formatters.
  LSPConfig: Conecta o Neovim aos servidores de linguagem instalados.
]]
return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        tag = "v0.1.8", -- Pinning version to avoid breaking changes in master/nightly
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Adiciona capacidades de autocompletar ao LSP padrão
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- Configuração para Python (Pyright)
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            -- Configuração para Lua (Lua LS)
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
        end,
    },
}
