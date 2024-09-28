-- NOTE: Configuração do mini.hipatterns

return {
  {
    "echasnovski/mini.hipatterns", -- Especifica o repositório do plugin "mini.hipatterns"
    event = "BufReadPre", -- O plugin é carregado antes da leitura de um buffer
    opts = {
      highlighters = { -- Configurações para os realçadores
        hsl_color = { -- Realçador para cores HSL
          pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)", -- Padrão para encontrar cores HSL
          group = function(_, match) -- Função que define o grupo de realce baseado na correspondência
            local utils = require("solarized-osaka.hsl") -- Importa utilitários HSL
            --- @type string, string, string
            local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)") -- Captura os componentes HSL
            --- @type number?, number?, number?
            local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl) -- Converte os componentes para número
            --- @type string
            local hex_color = utils.hslToHex(h, s, l) -- Converte HSL para hexadecimal
            return MiniHipatterns.compute_hex_color_group(hex_color, "bg") -- ex: #047
          end,
        },
      },
    },
  },
}
