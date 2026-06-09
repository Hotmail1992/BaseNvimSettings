local opt = vim.opt


-- ОТКЛЮЧАЕМ использование прямых слешей (/) для совместимости с xcopy
vim.opt.shellslash = false

-- Настраиваем команды копирования (без лишних оберток)
vim.g.netrw_localcopycmd = 'xcopy'
vim.g.netrw_localcopydircmd = 'xcopy /e /i /y'

-- Синхронизируем директории, чтобы пути всегда были актуальны
vim.g.netrw_keepdir = 0

opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.fillchars = { eob = " " }

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.wrap = true

opt.undofile = true
opt.swapfile = false
opt.fileencoding = "utf-8"
opt.clipboard = "unnamedplus"

opt.timeoutlen = 500

vim.cmd([[command! SystemOpen execute '!start "" ' . shellescape(expand('%:p'))]])
