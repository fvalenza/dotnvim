local M = {
  "christoomey/vim-tmux-navigator",
  -- commit = "f5d970d4506f385b29534252d8c15a782fa53034",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-h>", '<cmd>TmuxNavigateLeft<CR>', desc = "Toggle split Maximization", mode = "n", opts_keymap },
    { "<C-j>", '<cmd>TmuxNavigateDown<CR>', desc = "Toggle split Maximization", mode = "n", opts_keymap },
    { "<C-k>", '<cmd>TmuxNavigateUp<CR>', desc = "Toggle split Maximization", mode = "n", opts_keymap },
    { "<C-l>", '<cmd>TmuxNavigateRight<CR>', desc = "Toggle split Maximization", mode = "n", opts_keymap },
  },
}

return M
