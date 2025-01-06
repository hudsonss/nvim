return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        require("telescope").setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    -- Ajusta a largura do explorador
                    preview_width = 0.65, -- Define 65% da tela para o preview
                    width = 0.8, -- Define 80% da largura da tela para o Telescope
                    height = 0.9, -- Define 90% da altura da tela para o Telescope
                },
                -- Outras configurações padrão aqui
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
            },
        })
    end,
}
