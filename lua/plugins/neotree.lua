return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = false,
            enable_diagnostics = true,
            enable_git_status = true,
            popup_border_style = "rounded",
            sort_case_insensitive = false,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
            window = { width = 36 },
            event_handlers = {

                {
                    event = "file_open_requested",
                    handler = function()
                        -- auto close
                        -- vim.cmd("Neotree close")
                        -- OR
                        require("neo-tree.command").execute({ action = "close" })
                    end,
                },
            },
        })
    end,
}
