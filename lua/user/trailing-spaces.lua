-- not working ???
-- https://www.reddit.com/r/neovim/comments/rw1qt7/how_do_you_deal_with_trailing_white_spaces/
local opts_keymap = { silent = true }

local M = {
  "echasnovski/mini.trailspace",
  cmd = { "MiniTrailspace"},
}

function M.config()
  require('mini.trailspace').setup()
end

return M
