-- NOTE: Aqui fica a configuração flash.nvim

return {
  {
    enabled = false, -- Define se o plugin "flash.nvim" está habilitado ou não
    "folke/flash.nvim", -- Especifica o repositório do plugin
    opts = {
      search = { -- Configurações específicas para busca
        forward = true, -- Permite busca para frente
        multi_window = false, -- Desabilita busca em múltiplas janelas
        wrap = false, -- Não permite que a busca faça wrap no final
        incremental = true, -- Ativa busca incremental
      },
    },
  },
}
