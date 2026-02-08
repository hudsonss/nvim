--[[
  LSP Config & Mason
  Configuração tradicional e compatível com versões antigas do mason-lspconfig
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

            ------------------------------------------------------------------
            -- IMPORTAÇÃO DOS MÓDULOS
            ------------------------------------------------------------------
            local ok_mason, mason = pcall(require, "mason")
            local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
            local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
            local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

            if not (ok_mason and ok_mason_lsp and ok_lspconfig and ok_cmp) then
                vim.notify("Erro ao carregar Mason/LSP", vim.log.levels.ERROR)
                return
            end

            ------------------------------------------------------------------
            -- CAPABILITIES
            -- Habilita integração do LSP com o autocompletar
            ------------------------------------------------------------------
            local capabilities = cmp_nvim_lsp.default_capabilities()

            ------------------------------------------------------------------
            -- 1. MASON
            -- Responsável apenas por instalar servidores
            ------------------------------------------------------------------
            mason.setup()

            ------------------------------------------------------------------
            -- 2. MASON-LSPCONFIG
            -- Define quais servidores devem estar instalados
            ------------------------------------------------------------------
            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                },
                automatic_installation = true,
            })

            ------------------------------------------------------------------
            -- 3. CONFIGURAÇÃO MANUAL DOS SERVIDORES
            -- Método clássico: explícito, previsível e sem mágica
            ------------------------------------------------------------------

            -- Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- Python
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
        end,
    },
}
