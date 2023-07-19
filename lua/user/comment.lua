local opts_keymap = { silent = true }

local M = {
  "numToStr/Comment.nvim",
  commit = "eab2c83a0207369900e92783f56990808082eac2",
  event = {"BufRead", "BufNewFile"},
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
      commit = "729d83ecb990dc2b30272833c213cc6d49ed5214",
    },
  },
  keys = {
    { "<C-_>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Todo", mode = "n", opts_keymap }, -- <C-_> is actually <C-/> (ctrl slash)  -- mode = { "n", "v" }
    { "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", desc = "Todo", mode = "x", opts_keymap }, -- mode = { "n", "v" }    { "<A-_>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Todo", mode = "n", opts_keymap }, -- <C-_> is actually <C-/> (ctrl slash)  -- mode = { "n", "v" }
    { "<A-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Todo", mode = "n", opts_keymap }, -- <C-_> is actually <C-/> (ctrl slash)  -- mode = { "n", "v" }
    { "<A-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", desc = "Todo", mode = "x", opts_keymap }, -- mode = { "n", "v" }

  },
}

function M.config()
  pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == "typescriptreact" then
      local U = require "Comment.utils"

      -- Determine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.blockwise then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end

      return require("ts_context_commentstring.internal").calculate_commentstring {
        key = type,
        location = location,
      }
    end
  end
end

return M
