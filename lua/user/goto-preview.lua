local M = {
  "rmagatti/goto-preview",
  -- commit = "19aad0f41f47affbba1274f05e3c067e6d718e1e",
  keys = {
    { "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", desc = "GoToPreview Definition", mode = "n"},
    { "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", desc = "GoToPreview Type definition", mode = "n"},
    { "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", desc = "GoToPreview Implementation", mode = "n"},
    { "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", desc = "GoToPreview Close Windows", mode = "n"},
    { "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", desc = "GoToPreview References", mode = "n"},
  },
}

function M.config()
  local status_ok, goto_preview = pcall(require, "goto-preview")
  if not status_ok then
    return
  end

  goto_preview.setup {
    width = 120; -- Width of the floating window
    height = 15; -- Height of the floating window
    border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
    default_mappings = false; -- Bind default mappings
    debug = false; -- Print debug information
    opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
    resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
    post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
    references = { -- Configure the telescope UI for slowing the references cycling window.
      telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
    };
    -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
    focus_on_open = true; -- Focus the floating window when opening it.
    dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
    force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
    bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
    stack_floating_preview_windows = true, -- Whether to nest floating windows
    preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
}

end

return M
