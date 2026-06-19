return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    -- Список языков, которые гарантированно скачаются сами
    ensure_installed = { 
      "lua", 
      "vim", 
      "vimdoc", 
      "query", 
      "markdown", 
      "markdown_inline",
      "regex", -- ОБЯЗАТЕЛЬНО ДОБАВЬТЕ СЮДА
    },
    highlight = { enabled = true },
    disable = { 
      "text",
      "plaintex"
    },
  },
}
