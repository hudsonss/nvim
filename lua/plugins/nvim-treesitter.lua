--[[
  Treesitter
  Motor de destaque de sintaxe (syntax highlighting) avançado.
  Melhora significativamente as cores do código, entendendo a estrutura real da linguagem.
]]
return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "python", "javascript", "html", "java", "query", "markdown", "markdown_inline"
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
