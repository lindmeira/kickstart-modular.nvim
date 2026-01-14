return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = false, cpp = false }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        make = { 'mbake' },
        markdown = { 'mdformat', 'markdownlint', stop_after_first = true },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        php = { 'pretty-php' },
        lua = { 'stylua' },
        sh = { 'shfmt' },
      },
      formatters = {
        shfmt = {
          args = { '--indent', '4' },
        },
        -- astyle = {
        --   args = {
        --     '--break-closing-brackets',
        --     '--indent-continuation=2',
        --     '--indent=spaces=2',
        --     '--style=kr',
        --   },
        -- },
        mbake = {
          command = 'mbake',
          args = { 'format', '--stdin' },
          stdin = true,
        },
        prettier = {
          prepend_args = {
            -- '--tab-width=4',
            '--single-quote',
            '--config-precedence=prefer-file',
          },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
