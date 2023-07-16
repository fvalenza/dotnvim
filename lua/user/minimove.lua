-- Made it work thanks to https://github.com/alpha2phi/modern-neovim/blob/12-ai/lua/plugins/mini.lua
local opts_keymap = { silent = true }

local M = {
  "echasnovski/mini.move",
  keys = { "<<M-h>", "<M-l>", "<M-j>", "<M-k>" },
}

function M.config()
  require('mini.move').setup()
end


return M
