-- NOTE: Configuração telescope.lua

return {
  {
    "telescope.nvim", -- Especifica o repositório do plugin "telescope.nvim"
    dependencies = { -- Dependências do plugin Telescope
      {
        "nvim-telescope/telescope-fzf-native.nvim", -- Plugin para integração com FZF
        build = "make", -- Comando para construir a extensão
      },
      "nvim-telescope/telescope-file-browser.nvim", -- Plugin para browser de arquivos
    },
    keys = { -- Mapeamentos de teclas para ações do Telescope
      {
        "<leader>fP", -- Atalho para encontrar arquivos de plugins
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root, -- Define o diretório atual
          })
        end,
        desc = "Find Plugin File", -- Descrição do atalho
      },
      {
        ";;", -- Atalho para listar arquivos no diretório atual
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false, -- Ignora arquivos .gitignore
            hidden = true, -- Inclui arquivos ocultos
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore", -- Descrição do atalho
      },
      {
        ";r", -- Atalho para busca ao vivo
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep({
            additional_args = { "--hidden" }, -- Permite buscar em arquivos ocultos
          })
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore", -- Descrição do atalho
      },
      {
        "\\\\", -- Atalho para listar buffers abertos
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers() -- Lista os buffers abertos
        end,
        desc = "Lists open buffers", -- Descrição do atalho
      },
      {
        ";t", -- Atalho para listar tags de ajuda
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags() -- Lista as tags de ajuda
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>", -- Descrição do atalho
      },
      {
        ";p", -- Atalho para retomar o último picker do Telescope
        function()
          local builtin = require("telescope.builtin")
          builtin.resume() -- Retoma o último picker aberto
        end,
        desc = "Resume the previous telescope picker", -- Descrição do atalho
      },
      {
        ";e", -- Atalho para listar diagnósticos
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics() -- Lista os diagnósticos de todos os buffers abertos
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer", -- Descrição do atalho
      },
      {
        ";s", -- Atalho para listar funções e variáveis do Treesitter
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter() -- Lista nomes de funções e variáveis usando Treesitter
        end,
        desc = "Lists Function names, variables, from Treesitter", -- Descrição do atalho
      },
      {
        "sf", -- Atalho para abrir o browser de arquivos
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir() -- Função que retorna o diretório do buffer atual
            return vim.fn.expand("%:p:h") -- Retorna o caminho do diretório do buffer
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h", -- Define o caminho do browser de arquivos
            cwd = telescope_buffer_dir(), -- Define o diretório atual do browser
            respect_gitignore = false, -- Ignora o .gitignore
            hidden = true, -- Permite arquivos ocultos
            grouped = true, -- Agrupa arquivos no browser
            previewer = false, -- Desabilita o visualizador de prévia
            initial_mode = "normal", -- Define o modo inicial do browser
            layout_config = { height = 40 }, -- Define a altura do layout do browser
          })
        end,
        desc = "Open File Browser with the path of the current buffer", -- Descrição do atalho
      },
    },
    config = function(_, opts) -- Função de configuração para o Telescope
      local telescope = require("telescope") -- Importa o Telescope
      local actions = require("telescope.actions") -- Importa ações do Telescope
      local fb_actions = require("telescope").extensions.file_browser.actions -- Importa ações do browser de arquivos

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, { -- Configura as opções padrão
        wrap_results = true, -- Permite que os resultados sejam quebrados em várias linhas
        layout_strategy = "vertical", -- Define a estratégia de layout como horizontal
        layout_config = { prompt_position = "top" }, -- Define a posição do prompt para o topo
        sorting_strategy = "ascending", -- Define a estratégia de ordenação como ascendente
        winblend = 0, -- Define a transparência da janela
        mappings = {
          n = {}, -- Mapeamentos de teclas em modo normal (inicialmente vazio)
        },
      })
      opts.pickers = { -- Configurações específicas para pickers
        diagnostics = { -- Configurações para o picker de diagnósticos
          theme = "ivy", -- Define o tema como "ivy"
          initial_mode = "normal", -- Define o modo inicial como normal
          layout_config = {
            preview_cutoff = 9999, -- Define o corte de pré-visualização
          },
        },
      }
      opts.extensions = { -- Configurações de extensões do Telescope
        file_browser = {
          theme = "dropdown", -- Define o tema do browser como "dropdown"
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true, -- Desabilita netrw e usa o browser de arquivos do Telescope
          mappings = { -- Mapeamentos personalizados em modo de inserção
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create, -- Mapeia a criação de arquivos
              ["h"] = fb_actions.goto_parent_dir, -- Mapeia para ir ao diretório pai
              ["/"] = function() -- Mapeia a abertura do modo de inserção
                vim.cmd("startinsert") -- Inicia o modo de inserção
              end,
              ["<C-u>"] = function(prompt_bufnr) -- Mapeia o atalho para mover seleção para cima
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr) -- Move a seleção para cima
                end
              end,
              ["<C-d>"] = function(prompt_bufnr) -- Mapeia o atalho para mover seleção para baixo
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr) -- Move a seleção para baixo
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up, -- Mapeia o atalho para rolar a pré-visualização para cima
              ["<PageDown>"] = actions.preview_scrolling_down, -- Mapeia o atalho para rolar a pré-visualização para baixo
            },
          },
        },
      }
      telescope.setup(opts) -- Configura o Telescope com as opções definidas
      require("telescope").load_extension("fzf") -- Carrega a extensão FZF
      require("telescope").load_extension("file_browser") -- Carrega a extensão do browser de arquivos
    end,
  },
}
