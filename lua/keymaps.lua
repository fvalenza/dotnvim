-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

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
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

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
-- keymap("n", "<leader>nh", "<cmd>nohl<CR>", opts) -- is there i difference ?


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



-- -- increment/decrement numbers
-- keymap("n", "<leader>+", "<C-a>") -- increment
-- keymap("n", "<leader>-", "<C-x>") -- decrement

-- ----------------------
-- -- Plugin Keybinds
-- ----------------------


-- local opts = { noremap = true, silent = true }

-- -- Move text up and down
-- keymap("n", "K", ":m .-2<CR>==")-- Move the lines selected up ( ctrl - shift - up equivalent)
-- keymap("v", "J", ":m '>+1<CR>gv=gv") -- Move the lines selected down ( ctrl - shift - down equivalent)
-- keymap("v", "K", ":m '<-2<CR>gv=gv")-- Move the lines selected up ( ctrl - shift - up equivalent)
-- keymap("i", "J", "<Esc>:m .+1<CR>==gi") -- Move the lines selected down ( ctrl - shift - down equivalent)
-- keymap("i", "K", "<Esc>:m .-2<CR>==gi")-- Move the lines selected up ( ctrl - shift - up equivalent)



-- -- keymap("n", "J", "mzJ`z") -- Append the current line to the previous one BUT keep the cursor on current line
-- keymap("n", "<C-d>", "<C-d>zz") -- cursor stays in the middle of screen when moving half page down
-- keymap("n", "<C-u>", "<C-u>zz") -- cursor stays in the middle of screen when moving half page down)
-- keymap("n", "n", "nzzzv") -- cursor stays in the middle of screen when going to next find result of search
-- keymap("n", "N", "Nzzzv") -- cursor stays in the middle of screen when going to previous find result of search

-- keymap("x", "<leader>p", [["_dP]]) -- delete selection into void register and Paste  ( so you can still copy the same word)
-- keymap({"n", "v"}, "<leader>d", [["_d"]]) -- delete goes into void register (so you don't lose you clipboard)

-- -- https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/
-- -- Copy to system clipboard
-- -- keymap({"n", "v"}, "<leader>y", [["+y]]) -- leader y yanks selection into + register
-- -- keymap("n", "<leader>Y", [["+Y]]) -- leader Y yanks whole line (inclugind traling whitespace) into + register
--                                     -- EOL should also (that would be the diff with yg_) but does not work ?


-- -- Paste from system clipboard
-- -- keymap({"n", "v"}, "<leader>p", [["+p]])
-- -- keymap({"n", "v"}, "<leader>P", [["+P]])
-- --
-- -- delete single character without copying into register
-- keymap("n", "x", '"_x')
