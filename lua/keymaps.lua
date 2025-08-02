-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use <h> to move left."<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use <l> to move right."<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use <k> to move up."<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use <j> to move down."<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })

-- Set Ctrl-E to save current buffer, no matter the mode
-- vim.keymap.set({ 'n', 'v', 'i' }, '<C-e>', '<Cmd>update<CR>', { silent = true })

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

-- Wipe out buffers easily
vim.keymap.set('n', 'q!', '<Cmd>bw!<CR>', { silent = true })
vim.keymap.set('n', 'q', '<Cmd>bw<CR>', { silent = true })

vim.keymap.set('n', 'Q!', '<Cmd>qall!<CR>', { silent = true })
vim.keymap.set('n', 'Q', '<Cmd>qall<CR>', { silent = true })

-- Write buffers (interferes with Vim Motion's W, so it must remain commented out)
-- vim.keymap.set('n', 'W', '<Cmd>wall<CR>', { silent = true })

-- Move selected lines down in visual mode
vim.keymap.set('v', '<C-Down>', ":m '>+1<CR>gv=gv", { silent = true, remap = true })

-- Move selected lines up in visual mode
vim.keymap.set('v', '<C-Up>', ":m '<-2<CR>gv=gv", { silent = true, remap = true })

-- Move current line down in normal/insert mode
-- vim.keymap.set('n', '<C-j>', ':m .+1<CR>', { silent = true, remap = true })
-- vim.keymap.set('i', '<C-j>', '<C-o>:m .+1<CR><C-o>==', { silent = true, remap = true })
vim.keymap.set('n', '<C-Down>', ':m .+1<CR>', { silent = true, remap = true })
vim.keymap.set('i', '<C-Down>', '<C-o>:m .+1<CR><C-o>==', { silent = true, remap = true })

-- Move current line up in normal/insert mode
-- vim.keymap.set('n', '<C-k>', ':m .-2<CR>', { silent = true, remap = true })
-- vim.keymap.set('i', '<C-k>', '<C-o>:m .-2<CR><C-o>==', { silent = true, remap = true })
vim.keymap.set('n', '<C-Up>', ':m .-2<CR>', { silent = true, remap = true })
vim.keymap.set('i', '<C-Up>', '<C-o>:m .-2<CR><C-o>==', { silent = true, remap = true })

-- Move cursor one position to the right in insert mode
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move cursor right in insert mode' })

-- Undo latest insertion without leaving insert mode
vim.keymap.set('i', '<C-e>', '<C-o>u<C-o>==', { silent = true, remap = true })

-- Map C-c to yank to system's clipboard (not really needed)
-- vim.api.nvim_set_keymap('v', '<C-c>', '"_+y', { noremap = true, silent = true })

-- Call NeoGit
vim.keymap.set('n', '<C-g>', '<Cmd>Neogit<CR>', { silent = true })

-- Remap Q/W to q/w, respectively
vim.cmd 'command! Q q'
vim.cmd 'command! W w'

-- vim: ts=2 sts=2 sw=2 et
