local opts_keymap = { silent = true }

local M = {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
    },
  },
}

function M.config()
  require( "neoclip").setup()
end

return M
