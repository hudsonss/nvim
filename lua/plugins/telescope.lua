--[[
  Telescope
  Um buscador fuzzy altamente extensível.
  Permite procurar arquivos, palavras, commits, comandos e muito mais.
]]
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        require("telescope").setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    preview_width = 0.65, -- Define 65% da janela para o preview do arquivo
                    width = 0.8, -- 80% da largura da tela total
                    height = 0.9, -- 90% da altura da tela total
                },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true, -- Mostra como o tema fica ao navegar pela lista
                },
            },
        })
    end,
}
