return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Configuração do Volar (Vue 3 LSP)
        volar = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
          settings = {
            format = {
              enable = true,
            },
          },
        },
      },
    },
  },
}
