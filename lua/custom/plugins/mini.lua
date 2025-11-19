return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nne  [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.surround').setup()

      -- My personal additions (Meira, L.)
      require('mini.diff').setup {
        view = {
          style = 'sign',
          signs = { add = '+', change = '·', delete = '-' },
        },
      }

      -- local statusline = require 'mini.statusline'
      -- statusline.setup { use_icons = vim.g.have_nerd_font }
      --
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2v:%l/%L'
      -- end
    end,
  },
}
