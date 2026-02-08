--[[
  Nvim CMP (Completions)
  Este é o motor principal de autocompletar do Neovim.
  Ele mostra sugestões de código enquanto você digita, integrado com LSP, Snippets e Buffers.
]]
return {
    {
        "hrsh7th/cmp-nvim-lsp", -- Fonte de completion para o LSP
    },
    {
        "hrsh7th/nvim-cmp", -- O plugin principal de completion
        dependencies = {
            "L3MON4D3/LuaSnip", -- Motor de snippets
            "saadparwaiZ1/cmp_luasnip", -- Fonte de snippets para o cmp
            "rafamadriz/friendly-snippets", -- Coleção de snippets prontos
            "hrsh7th/cmp-buffer", -- Sugere palavras do buffer atual
            "hrsh7th/cmp-path", -- Sugere caminhos de arquivos
            "hrsh7th/cmp-cmdline", -- Sugere na linha de comando
             -- Dependência opcional para ícones bonitos no menu
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            cmp.setup({
                snippet = {
                    -- Define como os snippets são expandidos
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    -- Adiciona bordas às janelas de sugestão
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Rola a documentação para cima
                    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Rola a documentação para baixo
                    ["<A-Space>"] = cmp.mapping.complete(), -- Força abrir o menu de completion
                    ["<C-e>"] = cmp.mapping.abort(), -- Fecha o menu
                    ["<cr>"] = cmp.mapping.confirm({ select = true }), -- Confirma a seleção com Enter
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- Sugestões do LSP (inteligente)
                    { name = "luasnip" }, -- Sugestões de snippets
                }, {
                    { name = "buffer" }, -- Sugestões de texto do buffer
                }),
                -- Formatação visual do menu (ícones e tipos)
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol", 
                        maxwidth = {
                            menu = 50, 
                            abbr = 50, 
                        },
                        ellipsis_char = "...",
                        show_labelDetails = true,
                        before = function(entry, vim_item)
                            return vim_item
                        end,
                    }),
                },
            })
        end,
    },
}
