return {
  -- Главный плагин для отладки
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- Удобный графический интерфейс для DAP (панели переменных, стека и т.д.)
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      -- Специализированный адаптер для PowerShell
      "Willem-J-an/nvim-dap-powershell",
    },
    config = function()
      local dap = require("dap")

     -- Управление точками останова
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP: Точка останова' })
    vim.keymap.set('n', '<leader>dB', function()
    dap.set_breakpoint(vim.fn.input('Условие: '))
    end, { desc = 'DAP: Условная точка останова' })

   -- Управление процессом отладки
   vim.keymap.set('n', '<F5>', dap.continue, { desc = 'DAP: Запуск / Продолжить' })
   vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'DAP: Шаг обхода (Step Over)' })
   vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'DAP: Шаг внутрь (Step Into)' })
   vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'DAP: Шаг наружу (Step Out)' })

      local dapui = require("dapui")

      dapui.setup()

      -- Автоматическое открытие/закрытие окон DAP UI при старте отладки
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Инициализация адаптера PowerShell
      -- Он автоматически найдет PowerShell Editor Services (установите его через :Mason)
      require("dap-powershell").setup()
    end
  }
}
