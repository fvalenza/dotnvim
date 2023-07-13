local M = {
  "RRethy/vim-illuminate",
  commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298",
  event = "VeryLazy",
}

function M.config()
  local illuminate = require "illuminate"
  vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
  vim.api.nvim_set_keymap(
    "n",
    "<a-n>",
    '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',
    { noremap = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<a-p>",
    '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
    { noremap = true }
  )

  illuminate.configure {
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 200,
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "alpha",
      "NvimTree",
      "packer",
      "neogitstatus",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
  }

  -- This block should not be necessarry (and does nothing... why? )? Cause already set to underline in repository ? https://github.com/RRethy/vim-illuminate/blob/master/lua/illuminate.lua
  -- vim.cmd [[
  --   hi def IlluminatedWordText guifg=none guibg=none gui=underline
  --   hi def IlluminatedWordRead guifg=none guibg=none gui=underline
  --   hi def IlluminatedWordWrite guifg=none guibg=none gui=underline
  -- ]]
  -- vim.api.nvim_set_hl(0, 'IlluminatedWord',        { default = true, underline = true }) -- not working ??? see https://github.com/RRethy/vim-illuminate/issues/90 ?
  -- vim.api.nvim_set_hl(0, 'IlluminatedWordText',        { default = true, underline = true }) -- not working ??? see
  -- vim.api.nvim_set_hl(0, 'IlluminatedWordRead',        { default = true, underline = true }) -- not working ??? see
  -- vim.api.nvim_set_hl(0, 'IlluminatedWordWrite',        { default = true, underline = true }) -- not working ??? see
end

return M
