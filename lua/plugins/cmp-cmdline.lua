-- cmp-cmdline.lua

return {
    "hrsh7th/cmp-cmdline", -- Adicione a dependência aqui
    config = function()
        local cmp = require("cmp")

        -- Configuração do cmp-cmdline
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }, -- Sugestões de caminhos
            }, {
                { name = "cmdline" }, -- Sugestões de comandos
            }),
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }, -- Sugestões no buffer
            },
        })

        cmp.setup.cmdline("?", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }, -- Sugestões no buffer
            },
        })
    end,
}
