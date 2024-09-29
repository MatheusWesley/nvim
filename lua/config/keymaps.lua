-- NOTE:
-- Neste arquivo ficará todos os meus keymaps personalizados

-- Desabilitar o comportamento padrão da tecla espaço nos modos Normal e Visual
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Definição da variável opts que permite alterar os atalhos localmente
local opts = { noremap = true, silent = true }

-- Salvar arquivo com Ctrl + s
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", opts) -- Salvar arquivo

-- Sair do arquivo com Ctrl + q
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", opts) -- Sair do arquivo

-- Deletar um único caractere sem copiar para o registrador
vim.keymap.set("n", "x", '"_x', opts)

-- Manipulação de buffers (abas)
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts) -- Próximo buffer
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts) -- Buffer anterior
vim.keymap.set("n", "<C-x>", ":bdelete!<CR>", opts) -- Fecha buffer - (Ctrl + x)
vim.keymap.set("n", "<C-b>", "<cmd>enew<CR>", opts) -- Novo buffer (Ctrl + b)

-- Gerenciamento de janelas (splits)
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- Divide verticalmente
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- Divide horizontalmente
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- Igualar largura/altura das janelas
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- Fecha a janela dividida atual

-- Navegar entre splits
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- Vai para o split acima
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- Vai para o split abaixo
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- Vai para o split à esquerda
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- Vai para o split à direita

-- Gerenciamento de abas (tabs)
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- Nova aba
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- Fecha aba atual
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) -- Próxima aba
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) -- Aba anterior

-- Alternar quebra de linha
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts) -- Atalho para alternar quebra de linha

-- Seleciona todo o arquivo
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- Mantenha a seleção ao reindentar
vim.keymap.set("v", "<", "<gv", opts) -- Reindentar para a esquerda mantendo a seleção
vim.keymap.set("v", ">", ">gv", opts) -- Reindentar para a direita mantendo a seleção

-- Manter o último conteúdo copiado ao colar (sem sobrescrever o registrador)
vim.keymap.set("v", "p", '"_dP', opts) -- Cola sem substituir o conteúdo copiado
