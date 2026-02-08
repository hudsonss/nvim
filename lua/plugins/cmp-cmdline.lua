--[[
  CMP Cmdline
  Fornece autocompletar para a linha de comando do Neovim.
  Ao digitar ':' (comandos) ou '/' (busca), ele sugere opções disponíveis.
]]
return {
    "hrsh7th/cmp-cmdline",
    dependencies = { "hrsh7th/nvim-cmp" }, -- Depende do motor de completion principal
    config = function()
        local cmp = require("cmp")

        -- Configuração para modo de comando (:)
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }, -- Sugere caminhos de arquivos
            }, {
                { name = "cmdline" }, -- Sugere comandos do vim
            }),
        })

        -- Configuração para modo de busca (/)
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }, -- Sugere palavras do buffer atual
            },
        })

        -- Configuração para modo de busca reverso (?)
        cmp.setup.cmdline("?", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }, -- Sugere palavras do buffer atual
            },
        })
    end,
}
