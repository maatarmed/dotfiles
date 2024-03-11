return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
}
--[[branch = 'harpoon2',
  event = 'UIEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = function()
    local harpoon = require 'harpoon'
    local conf = require('telescope.config').values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
        table.insert(file_paths, item.value)
      end
      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end
    return {
      -- Harpoon marked files 1 through 4
      {
        '<leader>1',
        function()
          harpoon:list():select(1)
        end,
        desc = 'Harpoon buffer 1',
      },
      {
        '<leader>2',
        function()
          harpoon:list():select(2)
        end,
        desc = 'Harpoon buffer 2',
      },
      {
        '<leader>3',
        function()
          harpoon:list():select(3)
        end,
        desc = 'Harpoon buffer 3',
      },
      {
        '<leader>4',
        function()
          harpoon:list():select(4)
        end,
        desc = 'Harpoon buffer 4',
      },
      {
        '<C-S-N>',
        function()
          harpoon:list():next()
        end,
        desc = 'Toggle next buffers',
      },
      {
        '<C-S-P>',
        function()
          harpoon:list():prev()
        end,
        desc = 'Toggle previous buffers',
      },
      -- Harpoon user interface.
      {
        '<C-e>',
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Toggle Menu',
      },
      {
        '<leader>a',
        function()
          harpoon:list():append()
        end,
        desc = 'Harpoon add file',
      },
      {
        '<C-b>',
        function()
          toggle_telescope(harpoon:list())
        end,
        desc = 'Open Harpoon window',
      },
    }
  end,
  opts = function(_, opts)
    opts.settings = {
      save_on_change = true,
      key = function()
        return vim.loop.cwd()
      end,
    }
  end,
  config = function(_, opts)
    require('harpoon').setup(opts)
  end,
  --[[    local keymap = vim.keymap.set
    keymap('n', '<leader>a', function()
      harpoon:list():append()
    end, { desc = 'Add to harpoon list' })
  
    keymap('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open harpoon list' })

    keymap('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon Item 1' })

    keymap('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon Item 2' })

    keymap('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon Item 3' })

    keymap('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon Item 4' })

    keymap('n', '<leader>5', function()
      harpoon:list():select(5)
    end, { desc = 'Harpoon Item 5' })

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<C-e>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
  end, --]]
--}
