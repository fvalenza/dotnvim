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
    { "<leader>ff", '<cmd>Telescope find_files<CR>', desc = "Todo", mode = "n", opts_keymap },
    { "<leader>fs", '<cmd>Telescope live_grep<CR>', desc = "Todo", mode = "n", opts_keymap },
    { "<leader>fp", '<cmd>Telescope projects<CR>', desc = "Todo", mode = "n", opts_keymap },
    { "<leader>fb", '<cmd>Telescope buffers<CR>', desc = "Todo", mode = "n", opts_keymap },
    { "<leader>fr", '<cmd>Telescope lsp_document_symbols<CR>', desc = "Todo", mode = "n", opts_keymap },
    { "<leader>fR", '<cmd>Telescope lsp_references<CR>', desc = "Todo", mode = "n", opts_keymap },  -- TODO decide which one prefered between telescope leader-fR and leader-gR Trouble and gr lsp directly
    { "<leader>ps", function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end , desc = "Todo", mode = "n", opts_keymap }, -- mode = { "n", "v" } -- TODO: Apparently no difference with Telescope live_grep. To remove if true
    { "<leader>fy", '<cmd>Telescope neoclip<CR>' , desc = "telescope neoclip", mode = "n", opts_keymap },
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
