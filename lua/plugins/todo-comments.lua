-- NOTE: Configuração do todo-comments

return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true, -- Mostrar ícones na coluna de sinal
      sign_priority = 8, -- Prioridade do sinal
      -- Palavras-chave reconhecidas e suas configurações padrão
      keywords = {
        FIX = {
          icon = " ", -- Ícone usado para o sinal, use o que preferir
          color = "error", -- Pode ser uma cor hex como "#DC2626" ou um nome de cor definido, como "error"
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- Lista de aliases para FIX
        },
        TODO = { icon = "", color = "info", alt = { "FAZER", "IDEA" } },
        HACK = { icon = "󰈸", color = "warning" },
        WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "", color = "hint", alt = { "INFO", "COMMENT" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE", -- A cor do texto do comentário
        bg = "BOLD", -- A cor de fundo do texto (somente suportado no Neovim >= 0.5.0)
      },
      merge_keywords = true, -- Quando true, as palavras-chave personalizadas são mescladas com as padrões
      -- Destacar as palavras-chave quando usar o comando `:TodoTelescope`
      highlight = {
        multiline = true, -- Habilita comentários multilinha
        multiline_pattern = "^.", -- Lua pattern para identificar o início de um comentário multilinha
        multiline_context = 10, -- Linhas extras a serem exibidas para comentários multilinha
        before = "", -- "fg" ou "bg" ou vazio
        keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" ou vazio
        after = "fg", -- "fg" ou "bg" ou vazio
        pattern = [[.*<(KEYWORDS)\s*:]], -- Padrão ou tabela de padrões, usado para destacar (vim regex)
        comments_only = true, -- Usar apenas em comentários
        max_line_len = 400, -- Ignorar linhas mais longas que isso
        exclude = {}, -- Lista de tipos de arquivos a serem excluídos
      },
      -- Lista de cores nomeadas disponíveis para uso
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex que será usado para corresponder palavras-chave.
        -- não suporta multiline comments
        pattern = [[\b(KEYWORDS):]],
      },
    },
  },
}
