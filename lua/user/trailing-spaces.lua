-- not working ???
-- https://www.reddit.com/r/neovim/comments/rw1qt7/how_do_you_deal_with_trailing_white_spaces/

local opts_keymap = { silent = true }

local M = {
  "cappyzawa/trim.nvim",
  cmd = { "Trim", "TrimToggle"},
  keys = {
    { "<leader>w", '<cmd>Trim<CR>' , desc = "trailspace", mode = "n", opts_keymap },
    -- { "<leader>W", '<cmd>TrimToggle<CR>' , desc = "Toggle trim trailing", mode = "n", opts_keymap },
  },
}

function M.config()
  require("trim").setup({
    -- if you want to ignore markdown file.
    -- you can specify filetypes.
    ft_blocklist = {"markdown"},
    patterns = {},
    trim_on_write = false, -- TrimToggle toggles only this param from true to false to true
    trim_trailing = true,
    trim_last_line = true,
    trim_first_line = false,
  })
end

return M
