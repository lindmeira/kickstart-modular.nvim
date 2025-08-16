-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = ''

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '»·', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- Personal settings from my lifetime .vimrc file
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99

vim.opt.guicursor = 'i:ver25-blinkwait100-blinkon50-blinkoff50'
vim.opt.expandtab = true
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3

-- Set the colorscheme
-- vim.cmd.colorscheme 'vim'
-- vim.opt.termguicolors = false

-- Setup for TrueColor
-- vim.api.nvim_set_hl(0, "Visual", { bg = "black", fg = "none" })
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "grey" })
-- vim.api.nvim_set_hl(0, "Comment", { fg = "grey" })
-- vim.api.nvim_set_hl(0, "SpecialKey", { fg = "grey" })
-- vim.api.nvim_set_hl(0, "Whitespace", { fg = "grey" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "grey" })

-- Setup for 16 Colors
-- vim.api.nvim_set_hl(0, 'Visual', { ctermbg = 'black', ctermfg = 'none' })
-- vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 'darkgrey' })
-- vim.api.nvim_set_hl(0, 'Comment', { ctermfg = 'darkgrey' })
-- vim.api.nvim_set_hl(0, "SpecialKey", { ctermfg = "darkgrey" })
-- vim.api.nvim_set_hl(0, 'Whitespace', { ctermfg = 'darkgrey' })
-- vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 'none' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = vim.api.nvim_create_augroup('MarkdownSettings', { clear = true }),
  pattern = { '*.md', '*.markdown' },
  callback = function()
    vim.bo.textwidth = 80
    vim.bo.formatoptions = 'tcqawjp' -- Adjust formatoptions as needed
  end,
})

-- vim: ts=2 sts=2 sw=2 et
