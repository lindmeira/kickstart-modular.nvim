return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      {
        'rcarriga/nvim-notify',
        opts = {
          background_colour = '#000000',
        },
      },
      -- 'hrsh7th/nvim-cmp',
    },
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          -- ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- signature = {
      --   enabled = true,
      --   auto_open = true,
      -- },
      -- hover = {
      --   enabled = true,
      -- },
      -- message = {
      --   enabled = true,
      --   view = 'notify', -- Or a custom view
      -- },
      -- progress = {
      --   enabled = true,
      --   spinner = 'moon',
      -- },
      -- -- Configure how diagnostics are displayed
      -- diagnostics = {
      --   enabled = true,
      --   severity = {
      --     min = vim.diagnostic.severity.HINT,
      --   },
      --   view = 'mini', -- Or "notify", "telescope", etc.
      -- },
      -- -- you can enable a preset for easier configuration
      presets = {
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        bottom_search = false, -- use a classic bottom cmdline for search
        lsp_doc_border = true, -- add a border to hover docs and signature help
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
      },
    },
  },
}
