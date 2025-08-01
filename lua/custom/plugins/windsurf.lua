return {
  -- Copilot
  -- Original VIM implementation by Pope
  -- 'github/copilot.vim',

  {
    'Exafunction/windsurf.nvim',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('codeium').setup {
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,
          key_bindings = {
            clear = '<C-c>',
            next = "<M-[>",
            prev = '<M-]>',
          },
        },
      }
    end,
  },
}
