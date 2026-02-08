--[[ 
  Configuração do Lazy.nvim (Gerenciador de Plugins)
  Este arquivo faz o bootstrap do gerenciador de plugins 'lazy.nvim'
  e carrega as especificações de plugins da pasta 'lua/plugins'.
]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Falha ao clonar lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPressione qualquer tecla para sair..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Configuração do Lazy
require("lazy").setup({
	spec = {
		-- Importa todos os arquivos da pasta lua/plugins
		{ import = "plugins" },
	},
    -- Configurações adicionais do Lazy podem ser adicionadas aqui
    defaults = {
        lazy = false, -- Carrega plugins por padrão (pode mudar para true para otimizar startup)
        version = false, -- sempre usa a versão mais recente
    },
    checker = { enabled = true }, -- Verifica atualizações automaticamente
})
