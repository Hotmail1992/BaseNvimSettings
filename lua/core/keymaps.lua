local function map(mode, lhs, rhs, desc_or_opts)
  local opts = {}

  if type(desc_or_opts) == "string" then
    opts = { desc = desc_or_opts }
  elseif type(desc_or_opts) == "table" then
    opts = desc_or_opts
  end
  opts.silent = opts.silent ~= false

  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Нажать Пробел + w, чтобы сохранить файл
vim.keymap.set("n", "<Leader>w", ":w<CR>")

-- Нажать Пробел + e, чтобы открыть проводник файлов
vim.keymap.set("n", "<Leader>e", ":Lex<CR>")

-- Убрать фокус с терминала
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})

-- Убрать подсветку после поиска
map("n", "<Esc>", ":noh<CR>", "Clear Highlight")
