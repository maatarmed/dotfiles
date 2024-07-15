-- return {
--   'rockyzhang24/arctic.nvim',
--   dependencies = { 'rktjmp/lush.nvim' },
--   name = 'arctic',
--   branch = 'main',
--   priority = 1000,
--   config = function()
--     vim.cmd 'colorscheme arctic'
--   end,
-- }
return { -- You can easily changhh to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  -- 'folke/tokyonight.nvim',
  'catppuccin/nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  name = 'catppuccin',
  flavor = 'latte',
  background = { -- :h background
    light = 'latte',
    dark = 'mocha',
  },
  -- 'lunarvim/darkplus.nvim',
  config = function()
    -- Load the colorscheme here
    vim.cmd.colorscheme 'catppuccin'
    -- vim.cmd.colorscheme 'darkplus'

    -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
  end,
}
-- return { 'catppuccin/nvim', name = 'catppuccin', priority = 1000, lazy = false }
