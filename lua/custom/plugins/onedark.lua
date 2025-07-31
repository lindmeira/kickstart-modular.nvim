return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        transparent = true,
        style = 'darker',
        -- lualine = {
        --   transparent = true, -- lualine center bar transparency
        -- },
      }
      vim.cmd.colorscheme 'onedark'
    end,
  },
}
