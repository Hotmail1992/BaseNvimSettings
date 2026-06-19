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
  end,
}
