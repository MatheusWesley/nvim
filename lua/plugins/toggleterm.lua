return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = { { "<leader>w", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" } }, -- Alterado para Alt + '
    opts = {
      open_mapping = [[<leader>w]], -- Alterado para Alt + '
      direction = "float",
      shade_filetypes = {},
      shade_terminals = true, -- Ativa o sombreamento no terminal
      shading_factor = 2, -- Fator de sombreamento
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
      float_opts = {
        border = "curved", -- Borda do terminal flutuante: 'single', 'double', 'shadow', 'curved'
        winblend = 1, -- Transparência da janela
      },
    },
  },
}
