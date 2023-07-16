local opts_keymap = { silent = true }
local M = {
  'folke/todo-comments.nvim',
  opts = {},
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = {
    "TodoTrouble",
    "TodoTelescope",
  },
  keys = { -- TODO: choose one ?
    { "<leader>T", '<cmd>TodoTrouble<CR>', desc = "TODOs trouble", mode = "n", opts_keymap },
    -- { "<leader>T", '<cmd>TodoTelescope<CR>', desc = "TODOs telescope", mode = "n", opts_keymap },
  },
}

return M
