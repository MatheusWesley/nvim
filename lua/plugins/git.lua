-- NOTE: Configuração do git.lua

return {
  {
    "dinhhuy258/git.nvim", -- Especifica o repositório do plugin "git.nvim"
    event = "BufReadPre", -- O plugin é carregado antes da leitura de um buffer
    opts = {
      keymaps = { -- Configurações de atalhos de teclado para o plugin
        -- Open blame window
        blame = "<Leader>gb", -- Atalho para abrir a janela de "blame"
        -- Open file/folder in git repository
        browse = "<Leader>go", -- Atalho para navegar para arquivos ou pastas no repositório git
      },
    },
  },
}
