return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- Открыть Yazi по нажатию <leader>y
    {
      "<leader>y",
      function()
        require("yazi").yazi()
      end,
      desc = "Open yazi",
    },
  },
  opts = {
    open_for_directories = false, -- Чтобы Oil остался проводником для папок по умолчанию
    use_relative_paths = true,
      keymaps = {
          show_help = "~",
          open_file_in_vertical_split = "<C-v>",
      -- Меняем проблемный <C-x> на более стандартный <C-s>
          open_file_in_horizontal_split = "<C-s>", 
          open_file_in_tab = "<C-t>",
    },
  },
}
