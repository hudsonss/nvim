--[[
  LSP Config & Mason
  Este arquivo configura a inteligência de código (Language Server Protocol).
  Consolidamos a configuração do Mason e LSPConfig aqui para garantir a ordem correta de carregamento.
]]
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Importa os módulos necessários
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- 1. Inicializa o Mason (Instalador)
            mason.setup()

            -- 2. Inicializa o Mason-LSPConfig (Ponte)
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "pyright" },
                automatic_installation = true,
            })

            -- 3. Configura os Handlers (Isso substitui o setup manual de cada servidor)
            -- Nota: Verificamos se 'setup_handlers' existe para evitar erros
            if mason_lspconfig.setup_handlers then
                mason_lspconfig.setup_handlers({
                    -- Handler padrão: Configura qualquer servidor instalado que não tenha handler específico
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- Handler específico para Lua
                    ["lua_ls"] = function()
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
                    
                    -- Adicione outros handlers específicos aqui se necessário...
                })
            else
                -- Fallback caso mason-lspconfig esteja desatualizado ou com problemas
                vim.notify("Aviso: setup_handlers não encontrado no mason-lspconfig. Configurando manualmente.", vim.log.levels.WARN)
                
                -- Configuração manual de fallback
                lspconfig.lua_ls.setup({ capabilities = capabilities })
                lspconfig.pyright.setup({ capabilities = capabilities })
            end
        end,
    },
}
