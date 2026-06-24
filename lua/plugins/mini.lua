return {
  'echasnovski/mini.nvim',
  version = false, -- Использовать самую свежую версию из ветки main
  config = function()
    -- Инициализируем только модуль иконок
    require('mini.icons').setup({
      -- По умолчанию плагин настроен под Nerd Fonts
      style = 'glyph', 
    })
    
    -- Говорим Neovim эмулировать старый nvim-web-devicons,
    -- чтобы другие плагины не выдавали ошибок
    require('mini.icons').mock_nvim_web_devicons()
  end,
}
