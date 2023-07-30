local M = {
  lazy = false,
  "jinh0/eyeliner.nvim",
}

function M.config()
    require("eyeliner").setup({
        highlight_on_key = false,
        dim = false,
    })
end

return M
