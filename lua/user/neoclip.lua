local opts_keymap = { silent = true }

local M = {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
    },
  },
  -- keys = {
  --   { "<leader>xx", '<cmd>TroubleToggle<CR>', desc = "TroubleToggle", mode = "n", opts_keymap },
  --   { "<leader>xw", '<cmd>TroubleToggle workspace_diagnostics<CR>', desc = "TroubleToggle workspace_diagnostics", mode = "n", opts_keymap },
  --   { "<leader>xd", '<cmd>TroubleToggle document_diagnostics<CR>', desc = "TroubleToggle document_diagnostics", mode = "n", opts_keymap },
  --   { "<leader>xl", '<cmd>TroubleToggle loclist<CR>', desc = "TroubleToggle loclist", mode = "n", opts_keymap },
  --   { "<leader>xq", '<cmd>TroubleToggle quickfix<CR>', desc = "TroubleToggle quickfix", mode = "n", opts_keymap },
  --   { "<leader>gR", '<cmd>TroubleToggle lsp_references<CR>', desc = "TroubleToggle lsp_references", mode = "n", opts_keymap }, -- push in jumplist but not tagstack
  -- },
}

function M.config()
  require( "neoclip").setup()
end

return M
