--[[
  LSP Config & Mason
  Este arquivo configura a inteligência de código (Language Server Protocol).
  Mason: Gerencia a instalação de LSPs, linters e formatters.
  LSPConfig: Conecta o Neovim aos servidores de linguagem instalados.
]]
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright" },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local mason_lspconfig = require("mason-lspconfig")

            -- Configuração automática via Mason Handlers
            -- Isso garante que todos os servidores instalados pelo Mason sejam configurados corretamente
            mason_lspconfig.setup_handlers({
                -- Handler padrão (para todos os servidores sem configuração específica)
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                -- Configuração específica para Lua
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
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
                
                -- Se precisar de config específica para Python, adicione aqui:
                -- ["pyright"] = function() ... end
            })
        end,
    },
}
