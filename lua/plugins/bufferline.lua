--[[
  Bufferline
  Exibe os arquivos abertos (buffers) como abas no topo da janela.
  Permite navegar facilmente entre arquivos abertos e ver seu estado (modificado, erro, etc).
]]
return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ícones para os arquivos
    config = function()
        require("bufferline").setup({
            options = {
                termable = true,
                separator_style = "slant", -- Estilo do separador: 'slant' | 'thick' | 'thin' | { 'any', 'any' }
                close_command = "bdelete! %d", -- Comando para fechar o buffer
                buffer_close_icon = "󰅖",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                diagnostics = "nvim_lsp", -- Mostra erros do LSP na aba do arquivo
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                show_duplicate_prefix = true,
                auto_toggle_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },
                sort_by = "insert_after_current",
            },
        })
    end,
}
