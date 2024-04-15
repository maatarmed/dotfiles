-- return {
--   'nvimtools/none-ls.nvim',
--   opts = {
--     notify_on_error = false,
--     format_on_save = {
--       timeout_ms = 500,
--       lsp_fallback = true,
--     },
--     formatters_by_ft = {
--       lua = { 'stylua' },
--       python = { 'isort', 'black' },
--     },
--     diagnostics = {
--       enable = true,
--       disable = {},
--       linters = { pylint = {}, flake8 = {} },
--       filetypes = { python = { 'pylint', 'flake8' }, lua = { 'luacheck' } },
--       formatters = { black = {}, isort = {}, stylua = {} },
--     },
--   },
-- }
return {
  'nvimtools/none-ls.nvim',
}
