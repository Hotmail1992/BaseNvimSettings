return {
  "hrsh7th/nvim-cmp",
  enabled = true,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Дополнения от LSP (умный код)
    "hrsh7th/cmp-path",     -- Дополнение путей к файлам
    "hrsh7th/cmp-buffer",   -- Дополнение слов из текущего файла
    "hrsh7th/cmp-cmdline",  -- Дополнение в командной строке (:)
    "L3MON4D3/LuaSnip",     -- Движок сниппетов (обязателен для cmp)
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
       expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- Вызвать меню вручную
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Подтвердить выбор
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then cmp.select_next_item()
          else fallback() end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },   -- Те самые пути к файлам
        { name = "buffer" }, -- Текст из открытых файлов
      })
    })
  end
}
