-- NOTE:
-- Neste arquivo ficará configurado os esquemas de cores

return {
  {
    "craftzdog/solarized-osaka.nvim",
    branch = "osaka",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false, -- Certifica que o tema será carregado imediatamente
    priority = 1000, -- Define prioridade para garantir que o tema carregue antes
    config = function()
      -- Configurações do Rose Pine
      require("rose-pine").setup({
        variant = "auto", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = true,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },
        highlight_groups = {
          CursorLineNr = { fg = "rose", bold = true },
        },

        before_highlight = function(group, highlight, palette)
          -- Disable all undercurls
          if highlight.undercurl then
            highlight.undercurl = false
          end
          -- Change palette colour
          if highlight.fg == palette.pine then
            highlight.fg = palette.foam
          end
        end,
      })
      -- Ativa o tema
      -- vim.cmd("colorscheme rose-pine-moon")
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- desativa a configuração da cor de fundo.
        show_end_of_buffer = false, -- exibe os caracteres '~' após o final dos buffers
        term_colors = false, -- define as cores do terminal (por exemplo, `g:terminal_color_0`)
        dim_inactive = {
          enabled = true, -- atenua a cor de fundo da janela inativa
          shade = "dark",
          percentage = 0.15, -- porcentagem da sombra a ser aplicada à janela inativa
        },
        no_italic = false, -- força a desativação do itálico
        no_bold = false, -- força a desativação do negrito
        no_underline = false, -- força a desativação do sublinhado
        styles = { -- Manipula os estilos dos grupos de destaque gerais (veja `:h highlight-args`):
          comments = { "italic" }, -- Altera o estilo dos comentários
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Descomente para desativar estilos codificados
        },
        color_overrides = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- Para mais integrações de plugins, por favor, role para baixo (https://github.com/catppuccin/nvim#integrations)
        },
      })

      -- a configuração deve ser chamada antes de carregar
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
