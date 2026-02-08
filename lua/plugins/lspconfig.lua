--[[
  LSP Config & Mason
  Este arquivo é responsável por configurar o LSP (Language Server Protocol)
  no Neovim, utilizando o Mason como gerenciador de servidores.
  A ordem aqui é importante:
    1) Mason instala os servidores
    2) Mason-LSPConfig faz a ponte com o lspconfig
    3) lspconfig inicializa cada servidor
]]

return {
    {
        -- Plugin principal de configuração de LSP do Neovim
        "neovim/nvim-lspconfig",

        -- Dependências necessárias para instalação automática e integração
        dependencies = {
            "williamboman/mason.nvim",          -- Gerenciador de servidores LSP/DAP/Linters
            "williamboman/mason-lspconfig.nvim",-- Integra Mason com o lspconfig
            "hrsh7th/cmp-nvim-lsp",             -- Integra LSP com o nvim-cmp (autocompletar)
        },

        -- Função executada quando o plugin é carregado
        config = function()

            ------------------------------------------------------------------
            -- IMPORTAÇÃO DOS MÓDULOS
            -- pcall evita que o Neovim quebre caso algum plugin não carregue
            ------------------------------------------------------------------
            local ok_mason, mason = pcall(require, "mason")
            local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
            local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
            local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

            -- Se algum módulo essencial falhar, interrompe a configuração
            if not (ok_mason and ok_mason_lsp and ok_lspconfig and ok_cmp) then
                vim.notify(
                    "Erro ao carregar Mason ou LSPConfig. Verifique as dependências.",
                    vim.log.levels.ERROR
                )
                return
            end

            ------------------------------------------------------------------
            -- CAPABILITIES
            -- Informa aos servidores LSP quais recursos o cliente suporta
            -- Aqui habilitamos integração completa com o autocompletar (cmp)
            ------------------------------------------------------------------
            local capabilities = cmp_nvim_lsp.default_capabilities()

            ------------------------------------------------------------------
            -- 1. MASON
            -- Inicializa o Mason, responsável apenas por instalar servidores
            ------------------------------------------------------------------
            mason.setup()

            ------------------------------------------------------------------
            -- 2. MASON-LSPCONFIG
            -- Define quais servidores devem estar instalados e
            -- ativa instalação automática quando necessário
            ------------------------------------------------------------------
            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",   -- Servidor LSP para Lua
                    "pyright",  -- Servidor LSP para Python
                },
                automatic_installation = true,
            })

            ------------------------------------------------------------------
            -- 3. SETUP DOS HANDLERS
            -- Cada handler define como um servidor LSP será inicializado
            -- Se não houver um handler específico, usa-se o handler padrão
            ------------------------------------------------------------------
            mason_lspconfig.setup_handlers({

                ------------------------------------------------------------------
                -- HANDLER PADRÃO
                -- Executado para qualquer servidor que não tenha configuração
                -- específica definida abaixo
                ------------------------------------------------------------------
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ------------------------------------------------------------------
                -- HANDLER ESPECÍFICO: LUA
                -- Ajusta diagnósticos e comportamento do servidor lua_ls
                ------------------------------------------------------------------
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                -- Evita erro ao usar a variável global "vim"
                                diagnostics = {
                                    globals = { "vim" },
                                },

                                -- Não força análise de bibliotecas externas
                                workspace = {
                                    checkThirdParty = false,
                                },

                                -- Desativa telemetria por padrão
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    })
                end,

                ------------------------------------------------------------------
                -- Outros servidores específicos podem ser configurados aqui
                -- Exemplo:
                -- ["pyright"] = function()
                --     lspconfig.pyright.setup({ ... })
                -- end
                ------------------------------------------------------------------
            })
        end,
    },
}
