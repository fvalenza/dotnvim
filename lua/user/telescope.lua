local opts_keymap = { silent = true }

local M = {
  "nvim-telescope/telescope.nvim",
  commit = "40c31fdde93bcd85aeb3447bb3e2a3208395a868",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
      "AckslD/nvim-neoclip.lua",
    },
  },
  keys = {
    { "<leader>ff", '<cmd>Telescope find_files<CR>', desc = "Todo", mode = "n", opts_keymap }, -- mode = { "n", "v" }
    { "<leader>ft", '<cmd>Telescope live_grep<CR>', desc = "Todo", mode = "n", opts_keymap }, -- mode = { "n", "v" }
    { "<leader>fp", '<cmd>Telescope projects<CR>', desc = "Todo", mode = "n", opts_keymap }, -- mode = { "n", "v" }
    { "<leader>fb", '<cmd>Telescope buffers<CR>', desc = "Todo", mode = "n", opts_keymap }, -- mode = { "n", "v" }
    { "<leader>fr", '<cmd>Telescope lsp_document_symbols<CR>', desc = "Todo", mode = "n", opts_keymap }, -- mode = { "n", "v" }
    { "<leader>fy", '<cmd>Telescope neoclip<CR>' , desc = "telescope neoclip", mode = "n", opts_keymap }, -- mode = { "n", "v" } -- TODO: Apparently no difference with Telescope live_grep. To remove if true
  },
}

local actions = require "telescope.actions"

M.opts = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = {
      i = {
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
}

require('telescope').load_extension("neoclip")

return M
