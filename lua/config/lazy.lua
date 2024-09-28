-- Definir o caminho para o diretório do lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Verificar se o lazy.nvim está instalado no caminho definido
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- Definir o repositório Git para clonar lazy.nvim
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"

  -- Clonar o repositório stable do lazy.nvim para o caminho especificado
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  -- Se houver erro ao clonar o repositório
  if vim.v.shell_error ~= 0 then
    -- Mostrar uma mensagem de erro no Neovim
    vim.api.nvim_echo({
      { "Falha ao clonar lazy.nvim:\n", "ErrorMsg" }, -- Mostrar mensagem de erro
      { out, "WarningMsg" }, -- Mostrar saída de erro do Git
      { "\nPressione qualquer tecla para sair..." }, -- Instrução para o usuário sair
    }, true, {})

    -- Esperar o usuário pressionar uma tecla e então sair
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Adicionar o caminho do lazy.nvim ao runtime path do Neovim
vim.opt.rtp:prepend(lazypath)

-- Requer o lazy.nvim e inicia a configuração dos plugins
require("lazy").setup({
  spec = {
    -- Adiciona LazyVim e importa seus plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        -- Escolher o esquema de cores (atualmente comentado)
        -- colorscheme = "solarized-osaka",
      },
    },
    -- Importar/alternar com seus próprios plugins
    { import = "lazyvim.plugins.extras.linting.eslint" }, -- Plugin para ESLint (análise de código)
    { import = "lazyvim.plugins.extras.formatting.prettier" }, -- Plugin para Prettier (formatação)
    { import = "lazyvim.plugins.extras.lang.typescript" }, -- Suporte para TypeScript
    { import = "lazyvim.plugins.extras.lang.json" }, -- Suporte para JSON
    { import = "lazyvim.plugins.extras.lang.rust" }, -- Suporte para Rust
    { import = "lazyvim.plugins.extras.lang.tailwind" }, -- Suporte para Tailwind CSS
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" }, -- Plugin para reconhecimento de padrões
    { import = "plugins" }, -- Importa plugins personalizados definidos no diretório `plugins`
  },
  defaults = {
    -- Por padrão, somente os plugins do LazyVim serão carregados de forma lazy (sob demanda).
    -- Os plugins personalizados serão carregados durante a inicialização.
    -- Se você souber o que está fazendo, pode definir isso como `true` para carregar todos os seus plugins personalizados de forma lazy por padrão.
    lazy = true, -- Carregar plugins de forma lazy (sob demanda)

    -- Recomenda-se deixar `version=false` por enquanto, pois muitos plugins que suportam versionamento
    -- têm lançamentos desatualizados, o que pode quebrar sua instalação do Neovim.
    version = false, -- Sempre usar o commit mais recente do Git
    -- version = "*", -- Tentar instalar a última versão estável para plugins que suportam semver (versão semântica)
  },
  install = { colorscheme = { "tokyonight", "habamax" } }, -- Esquemas de cores a serem instalados
  checker = {
    enabled = true, -- Verificar atualizações de plugins periodicamente
    notify = false, -- Notificar sobre atualizações
  },
  performance = {
    rtp = {
      -- Desabilitar alguns plugins do runtime path (rtp) do Neovim para melhorar a performance
      disabled_plugins = {
        "gzip", -- Desabilitar suporte a gzip
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin", -- Desabilitar suporte a arquivos tar
        "tohtml", -- Desabilitar conversão para HTML
        "tutor", -- Desabilitar o tutor do Vim
        "zipPlugin", -- Desabilitar suporte a arquivos zip
      },
    },
  },
})
