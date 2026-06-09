return {
  "skywind3000/asynctasks.vim", -- Позволяет запускать асинхронные задачи компиляции
  dependencies = { "skywind3000/asyncrun.vim" },
  config = function()
    -- Настраиваем горячую клавишу F9 для компиляции ConTeXt LMTX
    vim.keymap.set("n", "<F9>", function()
      vim.cmd("write") -- Сохраняем файл
      local file = vim.fn.expand("%:p")
      local pdf = vim.fn.expand("%:p:r") .. ".pdf"
      
      -- Команда для Windows: компилируем через context.exe 
      -- и проверяем, открыт ли SumatraPDF (если нет — открываем)
      local cmd = string.format(
        'context "%s" && tasklist | findstr /I "SumatraPDF.exe" >nul || start "" SumatraPDF "%s"',
        file, pdf
      )
      
      -- Запускаем в фоне, чтобы Neovim не зависал во время компиляции
      vim.fn.jobstart(cmd, { detach = true })
    end, { desc = "Compile ConTeXt LMTX" })
  end
}
