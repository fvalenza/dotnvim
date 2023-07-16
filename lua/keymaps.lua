-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- window management
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>") -- close current split window
                                       --
-- Better window navigation inside neovim in case tmux navigator not loaded... should i test require and define them only is nok ?
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)  -- Make the window bigger top-down
keymap("n", "<C-Down>", ":resize -2<CR>", opts) -- Make the window smaller top-down
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- Make the window smaller left-right
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Make the window bigger left-right

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-q>", "<cmd>BufferClose<CR>", opts)
-- keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts) -- Shall be useless. Better to use telescope <leader>fb

keymap("n", "<leader>to", ":tabnew<CR>") -- open new tab ( barbar makes no dsictincition betwwen tabs and buffers)
-- Keeping it here in case i want to really use original tab feature of neovim
-- keymap("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- keymap("n", "<leader>tp", ":tabp<CR>") --  go to previous tab


-- Clear highlights
keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts)
-- keymap("n", "<leader>nh", "<cmd>nohl<CR>", opts) -- is there a difference ?


-- Better paste
keymap("v", "p", "P", opts)

-- Insert --
-- Press jk fast to go from insert to normal mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --
-- see https://github.com/folke/lazy.nvim#%EF%B8%8F-lazy-key-mappings to integrate mappings in the plugin conf file directly....

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts) -- should open repo in smerge ? or have all methods in sublime text -> merge ? at least open repo + File history is nice to have

-- DAP     -- to debug, keys added in specs of dap.lua but not working ?
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)







--  FVALENZA adding : to sort at the end (keep it or delete it..)




-- local opts = { noremap = true, silent = true }

-- Move text up and down
-- keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts) -- To remove if can get mini.move working
-- keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts) -- To remove if can get mini.move working
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts) -- To remove if can get mini.move working
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts) -- To remove if can get mini.move working
-- keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- To remove if can get mini.move working
-- keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- To remove if can get mini.move working

-- keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- lunarVimput this instead
-- keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- lunarVimput this instead
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


keymap("n", "<C-d>", "<C-d>zz") -- cursor stays in the middle of screen when moving half page down -- defqult in neovim ?
keymap("n", "<C-u>", "<C-u>zz") -- cursor stays in the middle of screen when moving half page up -- default in neovim ?
keymap("n", "n", "nzzzv") -- cursor stays in the middle of screen when going to next find result of search -- default in neovim ?
keymap("n", "N", "Nzzzv") -- cursor stays in the middle of screen when going to previous find result of search -- default in neovim ?
keymap("n", "J", "mzJ`z") -- Append the current line to the previous one BUT keep the cursor on current line


keymap("x", "<leader>p", [["_dP]]) -- delete selection into void register and Paste  ( so you can still copy the same word)
keymap({"n", "v"}, "<leader>d", [["_d"]]) -- delete goes into void register (so you don't lose you clipboard)



-- -- https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/

-- -- Copy to system clipboard.
--  a comparer a vim.opt.clipboard = "unnamedplus"
-- -- keymap({"n", "v"}, "<leader>y", [["+y]]) -- leader y yanks selection into + register
-- -- keymap("n", "<leader>Y", [["+Y]]) -- leader Y yanks whole line (inclugind traling whitespace) into + register
--                                     -- EOL should also (that would be the diff with yg_) but does not work ?
-- -- Paste from system clipboard
-- -- keymap({"n", "v"}, "<leader>p", [["+p]])
-- -- keymap({"n", "v"}, "<leader>P", [["+P]])
-- --

keymap("n", "x", '"_x') -- delete single character without copying into register


-- keymap("n", "Q", '"<nop>"') -- Why the primegean put this ? Dans video 0 to LSP
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") --  C-f pour switch de ssion tmux ?
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) --  Pour remplacer tous les mots du buffer comme celui sous le curseur



-- pris dans mini-basics
-- -- Copy/paste with system clipboard
-- map({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
-- map(  'n',        'gp', '"+p', { desc = 'Paste from system clipboard' })
-- -- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
-- map(  'x',        'gp', '"+P', { desc = 'Paste from system clipboard' })

-- -- Reselect latest changed, put, or yanked text
-- map('n', 'gV', '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true, replace_keycodes = false, desc = 'Visually select changed text' })

-- -- Search inside visually highlighted text. Use `silent = false` for it to
-- -- make effect immediately.
-- map('x', 'g/', '<esc>/\\%V', { silent = false, desc = 'Search inside visual selection' })
--
--  -- Alternative way to save and exit in Normal mode.
-- -- NOTE: Adding `redraw` helps with `cmdheight=0` if buffer is not modified
-- map(  'n',        '<C-S>', '<Cmd>silent! update | redraw<CR>',      { desc = 'Save' })
-- map({ 'i', 'x' }, '<C-S>', '<Esc><Cmd>silent! update | redraw<CR>', { desc = 'Save and go to Normal mode' })
--
-- Pour utiliser hjkl dans insert mode
-- if config.mappings.move_with_alt then
-- -- Move only sideways in command mode. Using `silent = false` makes movements
-- -- to be immediately shown.
-- map('c', '<M-h>', '<Left>',  { silent = false, desc = 'Left' })
-- map('c', '<M-l>', '<Right>', { silent = false, desc = 'Right' })

-- -- Don't `noremap` in insert mode to have these keybindings behave exactly
-- -- like arrows (crucial inside TelescopePrompt)
-- map('i', '<M-h>', '<Left>',  { noremap = false, desc = 'Left' })
-- map('i', '<M-j>', '<Down>',  { noremap = false, desc = 'Down' })
-- map('i', '<M-k>', '<Up>',    { noremap = false, desc = 'Up' })
-- map('i', '<M-l>', '<Right>', { noremap = false, desc = 'Right' })

-- map('t', '<M-h>', '<Left>',  { desc = 'Left' })
-- map('t', '<M-j>', '<Down>',  { desc = 'Down' })
-- map('t', '<M-k>', '<Up>',    { desc = 'Up' })
-- map('t', '<M-l>', '<Right>', { desc = 'Right' })
