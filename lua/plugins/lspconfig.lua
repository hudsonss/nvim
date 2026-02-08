--[[
  LSP Config & Mason
  Configuração compatível com Neovim 0.11+
  Usa a API nativa: vim.lsp.config
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
            -- IMPORTAÇÕES SEGURAS
            ------------------------------------------------------------------
            local ok_mason, mason = pcall(require, "mason")
            local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
            local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

            if not (ok_mason and ok_mason_lsp and ok_cmp) then
                vim.notify("Erro ao carregar Mason/LSP", vim.log.levels.ERROR)
                return
            end

            ------------------------------------------------------------------
            -- CAPABILITIES
            ------------------------------------------------------------------
            local capabilities = cmp_nvim_lsp.default_capabilities()

            ------------------------------------------------------------------
            -- 1. MASON
            ------------------------------------------------------------------
            mason.setup()

            ------------------------------------------------------------------
            -- 2. MASON-LSPCONFIG
            ------------------------------------------------------------------
            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                },
                automatic_installation = true,
            })

            ------------------------------------------------------------------
            -- 3. DEFINIÇÃO DOS SERVIDORES (API NOVA)
            ------------------------------------------------------------------

            -- Lua
            vim.lsp.config.lua_ls = {
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
            }

            -- Python
            vim.lsp.config.pyright = {
                capabilities = capabilities,
            }

            ------------------------------------------------------------------
            -- 4. ATIVAÇÃO DOS SERVIDORES
            ------------------------------------------------------------------
            vim.lsp.enable({ "lua_ls", "pyright" })
        end,
    },
}
