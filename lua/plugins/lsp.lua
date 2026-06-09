-- lua/plugins/lsp.lua
return {
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "lua_ls", "ts_ls", "pyright", "powershell_es" } },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/snacks.nvim" }, -- Гарантируем, что snacks загружен
    config = function()
      local lspconfig = require("lspconfig")

      -- Функция, выполняющаяся при подключении LSP к буферу
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        -- НАВИГАЦИЯ ЧЕРЕЗ SNACKS PICKER
        vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, opts) -- К определению
        vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, opts)  -- К ссылкам
        vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, opts) -- К реализациям
        vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, opts) -- К типам данных
        vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, opts)  -- Символы документа
        vim.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, opts) -- Символы воркспейса

        -- ДИАГНОСТИКА ЧЕРЕЗ SNACKS PICKER
        vim.keymap.set("n", "<leader>xx", function() Snacks.picker.diagnostics_buffer() end, opts) -- Ошибки текущего файла
        vim.keymap.set("n", "<leader>xX", function() Snacks.picker.diagnostics() end, opts)        -- Ошибки всего проекта

        -- СТАНДАРТНЫЕ ИНСТРУМЕНТЫ (Оставляем базовые Neovim интерфейсы)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)              -- Документация под курсором
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)    -- Переименование (автоматически использует Snacks)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Быстрые исправления (в UI от Snacks)
      end

      -- Автоматический сетап серверов
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
          })
        end,
      })
    end,

-- Кастомный переопределенный обработчик специально для PowerShell
    ["powershell_es"] = function()
      -- Динамически определяем путь к распакованному zip-пакету в Mason
      local package = mason_registry.get_package("powershell-editor-services")
      local bundle_path = package:get_install_path()

      lspconfig.powershell_es.setup({
        bundle_path = bundle_path, -- Обязательный параметр для powershell_es
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          powershell = {
            codeFormatting = {
              Preset = "OTBS", -- Стиль форматирования скобок (One True Brace Style)
            },
          },
        },
      })
    end,
  },
}
