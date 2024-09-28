-- Desativa o cursor de estilo gráfico no modo terminal (GUI)
-- Isso remove qualquer configuração personalizada de aparência do cursor no modo gráfico.
vim.cmd([[ set guicursor= ]])

-- Configurações para ocultar ou não caracteres especiais
vim.cmd([[
  set conceallevel=0
  set concealcursor="" 
]])

-- Desabilita a exibição de números relativos nas linhas
vim.opt.relativenumber = false

-- Habilita a exibição de números absolutos nas linhas
vim.opt.number = true
