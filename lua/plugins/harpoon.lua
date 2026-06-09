return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
--    harpoon:setup({
--      settings = {
--      save_on_toggle = true, 
--      sync_on_ui_close = true,
--    }
--  })

    -- Горячие клавиши для управления
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Загарпунить файл" })
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Открыть меню Harpoon" })

    -- Мгновенный переход к файлам по номерам (Ctrl + число)
    vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
  end,
}
