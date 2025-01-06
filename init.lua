vim.cmd(" let mapleader = ' '")

require ("preferences")
require ("keymaps")
-- require ("lualine")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.ur or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Falha ao clonar lazy.nvim:\n", "ErrorMsg"},
			{ out, "WarningMsg"},
			{ "\nPressione qualquer tecla pra sair..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins"},
	},
})

vim.cmd("colorscheme monokai-pro")
