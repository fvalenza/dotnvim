local M = {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  cmd = "AerialToggle",
}



function M.config()
  -- local status_ok, aerial = pcall(require, "aerial")
  -- if not status_ok then
  --   print("Could not load aerial")
  --   return
  -- end

  require('aerial').setup({
  -- Priority list of preferred backends for aerial.
  -- This can be a filetype map (see :help aerial-filetype-map)
  -- backends = { "treesitter", "lsp", "markdown", "man" },
  backends = { "lsp", "treesitter", "markdown", "man" },

  attach_mode = "global",

  layout = {
    -- Determines where the aerial window will be opened
    --   edge   - open aerial at the far right/left of the editor
    --   window - open aerial to the right/left of the current window
    placement = "window",

    min_width = 28,
  },

  filter_kind = false,

  show_guides = true,
  -- Customize the characters used when show_guides = true
  guides = {
    -- When the child item has a sibling below it
    mid_item = "├─",
    -- When the child item is the last in the list
    last_item = "└─",
    -- When there are nested child guides to the right
    nested_top = "│ ",
    -- Raw indentation
    whitespace = "  ",
  },

  keymaps = {
    ["[y"] = "actions.prev",
    ["]y"] = "actions.next",
    ["[Y"] = "actions.prev_up",
    ["]Y"] = "actions.next_up",
    ["{"] = false,
    ["}"] = false,
    ["[["] = false,
    ["]]"] = false,
  },


})
end




return M




-- You probably also want to set a keymap to toggle aerial
-- vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle<CR>')
