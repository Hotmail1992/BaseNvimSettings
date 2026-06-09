-- Проверяем, какая утилита PowerShell доступна в системе (pwsh для Core, powershell для Windows)
local powershell_cmd = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"

if vim.fn.executable(powershell_cmd) == 1 then
  vim.o.shell = powershell_cmd
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

return {
  "folke/snacks.nvim",
  priority = 1000, -- Важно! Плагин должен загружаться одним из первых
  lazy = false,    -- Отключаем ленивую загрузку для ядра (модули внутри сами управляют своей загрузкой)
  
  ---@type snacks.Config
  opts = {
    -- Включайте только те "закуски" (модули), которые вам нужны
    bigfile   = { enabled = true },
    dashboard = { enabled = true },
    notifier  = { enabled = true },
    image     = { enabled = false},
    statuscolumn = {enabled = true},
    input     = {enable = true },
    quickfile = { enabled = true },
    indent    = { enabled = true },
    picker    = { enabled = true, ui_select = true },
    words     = { enabled = true },
    explorer  = { enabled = true },
      explorer = {}, -- Включаем сам эксплорер
        picker = {
           sources = {
             explorer = {
                win = {
                  list = {
                  keys = {
                -- Теперь при нажатии на обычную "o" файл откроется через ОС
                ["o"] = "system", 
              },
            },
          },
        },
      },
    },
  },

  keys = {
    -- Назначаем горячие клавиши для активированных модулей
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Поиск файлов" },
    { "<leader>fg", function() Snacks.picker.grep() end,  desc = "Поиск текста (Grep)" },
    { "<leader>e",  function() Snacks.explorer() end,     desc = "Открыть проводник" },
    { "<leader>lg", function() Snacks.lazygit() end,      desc = "Открыть LazyGit" },
    { "<leader>fz", function() Snacks.picker.zoxide() end, desc = "Поиск папок (Zoxide)" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Поиск проектов" },
   
-- === РАБОТА С ТЕРМИНАЛОМ ВНУТРИ NEOVIM ===
      -- Открыть/скрыть дефолтный терминал (сплит снизу)
      { "<leader>t", function() Snacks.terminal.toggle() end, desc = "Терминал (Сплит)" },
      -- Открыть чистый терминал по центру экрана (Плавающее окно)
      { "<leader>ft", function() Snacks.terminal.open(nil, { style = "terminal" }) end, desc = "Всплывающий терминал" },
      -- Мгновенный запуск утилиты LazyGit во всплывающем окне
      { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit" },

  },
}
