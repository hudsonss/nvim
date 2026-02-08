--[[
  Neo Tree
  Um gerenciador de arquivos (File Explorer) em árvore.
  Permite navegar pelos diretórios, criar/deletar arquivos e ver o status do Git.
]]
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = false, -- Não fecha o neovim se o NeoTree for a última janela
            enable_diagnostics = true, -- Mostra erros nos arquivos da árvore
            enable_git_status = true, -- Mostra arquivos modificados/novos
            popup_border_style = "rounded",
            sort_case_insensitive = false,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false, -- Mostra arquivos ocultos (iniciados com .)
                    hide_gitignored = false, -- Mostra arquivos ignorados pelo git
                },
            },
            window = {
                width = 30, -- Largura da janela
            },
            event_handlers = {
                {
                    event = "file_open_requested",
                    handler = function()
                        -- Fecha o NeoTree automaticamente ao abrir um arquivo
                        require("neo-tree.command").execute({ action = "close" })
                    end,
                },
            },
        })
    end,
}
