-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- recenter after C-d
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Harpoon config
local nnoremap = require('config.keymap_utils').nnoremap
local harpoon_ui = require 'harpoon.ui'
local harpoon_mark = require 'harpoon.mark'
local harpoon = require 'harpoon'
-- Harpoon keybinds --
-- Open harpoon ui
nnoremap('<C-e>', function()
  harpoon_ui.toggle_quick_menu()
end)

-- Add current file to harpoon
nnoremap('<leader>a', function()
  harpoon_mark.add_file()
end)

-- Remove current file from harpoon
nnoremap('<leader>hr', function()
  harpoon_mark.rm_file()
end)

-- Remove all files from harpoon
nnoremap('<leader>hc', function()
  harpoon_mark.clear_all()
end)

nnoremap('<leader>1', function()
  harpoon_ui.nav_file(1)
end)

nnoremap('<leader>2', function()
  harpoon_ui.nav_file(2)
end)

nnoremap('<leader>3', function()
  harpoon_ui.nav_file(3)
end)

nnoremap('<leader>4', function()
  harpoon_ui.nav_file(4)
end)

nnoremap('<leader>5', function()
  harpoon_ui.nav_file(5)
end)
-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-S-P>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-S-N>', function()
  harpoon:list():next()
end)

-- Neotree config
vim.keymap.set('n', '<leader>E', ':Neotree filesystem toggle<CR>', { desc = 'Toggle [E]xplorer' })
vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})
-- vim-doge config
vim.keymap.set('n', '<leader>dG', ':DogeGenerate<CR>', { desc = 'Generate [D]oge' })
vim.keymap.set('n', '<leader>dgn', ':let g:doge_doc_standard_python = "numpy"<CR>', { desc = 'Generate [D]oge [N]umpy' })
vim.keymap.set('n', '<leader>dgg', ':let g:doge_doc_standard_python = "google"<CR>', { desc = 'Generate [D]oge[G]google' })

-- -- nabla config
-- nabla = require("nabla")
-- nnoremap("<leader>p", nabla.popup()<CR>, "Customize with popup({border = ...})  : `single` (default), `double`, `rounded`")
-- copilot config
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')

-- todo comments config
vim.keymap.set('n', '<leader>td', ':TodoTelescope<CR>', { desc = 'Show [T]odo comments' })
