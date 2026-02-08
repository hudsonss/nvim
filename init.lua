-- Carrega opções e configurações básicas
require("config.options")

-- Carrega mapeamentos de teclas
require("config.keymaps")

-- Inicializa o gerenciador de plugins (Lazy.nvim) e carrega plugins
require("config.lazy")

-- Define o esquema de cores (após carregar os plugins)
-- Nota: Isso pode falhar na primeira execução se o tema ainda não estiver instalado.
-- O Lazy geralmente lida bem com isso, mas é bom ter um fallback ou cmd silencioso.
pcall(vim.cmd, "colorscheme monokai-pro")
