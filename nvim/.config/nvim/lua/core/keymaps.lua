vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>bx', ':bdelete!<CR>', { desc = 'to delete curent buffer', noremap = false, silent = true }) -- close buffer
vim.keymap.set('n', '<leader>bb', '<cmd> enew <CR>', { desc = 'to add new buffer', noremap = false, silent = true }) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>spv', '<C-w>v', { desc = ' split window vertically', noremap = false, silent = true }) -- split window vertically
vim.keymap.set('n', '<leader>sph', '<C-w>s', { desc = ' split window horizontally', noremap = false, silent = true }) -- split window horizontally
vim.keymap.set('n', '<leader>spe', '<C-w>=', { desc = ' make split windows equal width & height', noremap = false, silent = true }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', { desc = ' close current split window', noremap = false, silent = true }) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = ' open new tab', noremap = false, silent = true }) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = ' close current tab', noremap = false, silent = true }) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = ' go to next tab', noremap = false, silent = true }) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = ' go to previous tab', noremap = false, silent = true }) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>ww', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-s', ':w', { desc = 'Save' })

--- undotree keymaps

vim.keymap.set('n', '<leader>lu', vim.cmd.UndotreeToggle, { desc = 'Undotree launch', noremap = false, silent = true })
