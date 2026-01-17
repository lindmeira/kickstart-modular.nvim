-- Minimal arduino.nvim setup for LazyVim
return {
  --'lindmeira/arduino.nvim',
  dir = vim.fn.stdpath 'config' .. '/lua/arduino.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    -- 'neovim/nvim-lspconfig',
  },
  ft = 'arduino',
  config = function()
    -- Set up LSP for Arduino files
    require('modules.lsp').setup()

    -- Auto-load Arduino plugin for .ino files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'arduino',
      callback = function()
        require 'modules'
      end,
    })
  end,
}
