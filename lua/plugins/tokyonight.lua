return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true, -- прозрачность
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  config = function (_, opts)
    require("tokyonight").setup(opts)
    -- вечное закрепление темы
    vim.cmd[[colorscheme tokyonight]]
-- Солнечно-желтый для всех неактивных относительных номеров
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#FFD700' })

-- Явное связывание для новых версий Neovim (на всякий случай)
vim.api.nvim_set_hl(0, 'LineNrAbove', { link = 'LineNr' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { link = 'LineNr' })

-- Делаем фон текущей строки видимым (подберите цвет под вашу темную тему)
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2A2B36' }) 

-- Если хотите, чтобы полоса выделяла и номер строки на полях:
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#FFFFFF', bg = '#2A2B36', bold = true })
  end,
}
