-- List of favorite files/marks per project
return {
  -- https://github.com/ThePrimeagen/harpoon
  'ThePrimeagen/harpoon',
  branch = 'master',
  event = 'VeryLazy',
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    'nvim-lua/plenary.nvim',
  },
  config = function()
    -- File Operations
    vim.keymap.set('n', '<leader>hm', function()
      require('harpoon.mark').add_file()
    end, { desc = 'Harpoon: Add current file' })
    vim.keymap.set('n', '<leader>lh', function()
      require('harpoon.ui').toggle_quick_menu()
    end, { desc = 'Harpoon: List all Harpoon files' })

    -- File Selection
    vim.keymap.set('n', '<leader>ha', function()
      require('harpoon.ui').nav_file(1)
    end, { desc = 'Harpoon: Select Harpoon file 1' })
    vim.keymap.set('n', '<leader>hs', function()
      require('harpoon.ui').nav_file(2)
    end, { desc = 'Harpoon: Select Harpoon file 2' })
    vim.keymap.set('n', '<leader>hd', function()
      require('harpoon.ui').nav_file(3)
    end, { desc = 'Harpoon: Select Harpoon file 3' })
    vim.keymap.set('n', '<leader>hf', function()
      require('harpoon.ui').nav_file(4)
    end, { desc = 'Harpoon: Select Harpoon file 4' })

    vim.keymap.set('n', '<leader>hca', function()
      require('harpoon.mark').clear_all()
    end, { desc = 'Harpoon: Clear all Harpoon files' })
    vim.keymap.set('n', '<leader>hda', function()
      require('harpoon.mark').rm_file(1)
    end, { desc = 'Harpoon: Clear Harpoon file 1' })
    vim.keymap.set('n', '<leader>hds', function()
      require('harpoon.mark').rm_file(2)
    end, { desc = 'Harpoon: Clear Harpoon file 2' })
    vim.keymap.set('n', '<leader>hdd', function()
      require('harpoon.mark').rm_file(3)
    end, { desc = 'Harpoon: Clear Harpoon file 3' })
    vim.keymap.set('n', '<leader>hdf', function()
      require('harpoon.mark').rm_file(4)
    end, { desc = 'Harpoon: Clear Harpoon file 4' })

    -- move jk

    vim.keymap.set('n', '<leader>j', function()
      require('harpoon.ui').nav_next() -- navigates to next mark
    end, { desc = ' navigates to next mark' })

    vim.keymap.set('n', '<leader>k', function()
      require('harpoon.ui').nav_prev()
    end, { desc = 'navigates to previous mark' })
  end,
}
