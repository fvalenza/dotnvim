return {}

-- can't make it work....https://github.com/wincent/scalpel/blob/main/plugin/scalpel.vim


-- 1 to 1 conversion of vimscript plugin should give something like:


-- local scalpel_loaded = vim.g.ScalpelLoaded
-- if scalpel_loaded or vim.o.compatible or vim.version().major < 7 then
--   return
-- end
-- vim.g.ScalpelLoaded = 1

-- local s = vim.api.nvim_replace_termcodes
-- local cmd = vim.g.ScalpelCommand or "Scalpel"
-- if cmd == "" or not cmd:match("^%u%a*$") then
--   vim.api.nvim_err_writeln("g:ScalpelCommand must contain only letters and start with a capital letter")
--   return
-- end

-- local function get_curpos_compat()
--   if vim.fn.exists("*getcurpos") == 1 then
--     return vim.fn.getcurpos()
--   else
--     return vim.fn.getpos(".")
--   end
-- end

-- local curpos = get_curpos_compat()

-- vim.cmd([[
-- augroup Scalpel
--   autocmd!
--   autocmd CursorMoved * let g:curpos = get_curpos_compat()
-- augroup END
-- ]])

-- local function get_curpos()
--   return curpos
-- end

-- local magic_chars = '"' .. vim.fn.escape("!\"#$%&'()*+,-./:;<=>?@[\\]^`{|}~", '"/\\|') .. '"'

-- local function cword(curpos)
--   return vim.fn.expand(s("<<C-R>=escape('" .. vim.fn.getline(curpos[2]) .. "', " .. magic_chars .. ")<CR>>"))
-- end

-- local function substitute(args, line1, line2, count)
--   local pattern = s("<<C-R>=escape('" .. args .. "', " .. magic_chars .. ")<CR>>")
--   local command = string.format("%s/\\v%s//<Left>", cmd, pattern)
--   vim.cmd(line1 .. "," .. line2 .. command)
-- end

-- local function map_leader()
--   local map = vim.g.ScalpelMap or 1
--   local leader = vim.api.nvim_replace_termcodes("<leader>", true, false, true)
--   if map == 1 then
--     if not vim.fn.hasmapto("<Plug>(Scalpel)") and vim.fn.maparg(leader .. "e", "n") == "" then
--       vim.api.nvim_set_keymap("n", leader .. "e", "<Plug>(Scalpel)", { noremap = true, silent = true })
--     end
--     if not vim.fn.hasmapto("<Plug>(ScalpelVisual)") and vim.fn.maparg(leader .. "e", "v") == "" then
--       vim.api.nvim_set_keymap("v", leader .. "e", "<Plug>(ScalpelVisual)", { noremap = true, silent = true })
--     end
--   end
-- end

-- vim.cmd(string.format("nnoremap <unique> <Plug>(Scalpel) :lua substitute('%s', %d, %d, 0)<CR>", magic_chars, 0, 0))
-- vim.cmd(string.format("vnoremap <unique> <Plug>(ScalpelVisual) :lua substitute(cword(vim.fn.get_curpos()), %d, %d, 0)<CR>", 0, 0))

-- map_leader()

-- -- Restore 'cpoptions' to its former value.
-- vim.o.cpoptions = s.cpoptions
