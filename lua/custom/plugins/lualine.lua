return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          component_separators = { left = '', right = '' },
          icons_enabled = true,
          theme = 'auto',
        },
        sections = {
          lualine_b = {
            'branch',
          },
          lualine_c = {
            {
              'diff',
              symbols = {
                added = ' ',
                removed = '󰍷 ',
                modified = ' ',
                --
                -- added = ' ', -- plus-circle
                -- removed = ' ', -- times-circle
                -- modified = '󰻂 ',
                --
                -- added = ' ',
                -- removed = ' ',
                -- modified = '󱗜 ',
              },
            },
            {
              'filename',
              path = 1,
            },
          },
          lualine_x = {
            'diagnostics',
            'filetype',
            'filesize',
          },
          lualine_y = {
            'progress',
          },
          lualine_z = {
            '%2v:%l/%L',
          },
        },
      }
    end,
  },
}
