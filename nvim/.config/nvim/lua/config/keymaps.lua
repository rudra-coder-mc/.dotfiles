-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

-- For conciseness
local opts = { noremap = true, silent = true }

-- map("n", "<S-H>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- map("n", "<S-L>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Move to start / end of line
-- map("n", "L", "$", { desc = "go to line end", noremap = false, silent = true })
-- map("n", "H", "^", { desc = "go to line start ", noremap = false, silent = true })

-- delete single character without copying into register
map("n", "x", '"_x', opts)

-- Vertical scroll and center
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Keep last yanked when pasting
map("v", "p", '"_dP', opts)

-- Command line history navigation
map("c", "<C-j>", "<C-n>", opts) -- Next command line history item
map("c", "<C-k>", "<C-p>", opts) -- Previous command line history item

--  floting terminal
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end
map("n", "<leader>fT", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<leader>ft", function()
  LazyVim.terminal()
end, { desc = "Terminal (cwd)" })
