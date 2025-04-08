-- Keymaps configuration for LazyVim
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Delete single character without copying into register
map("n", "x", '"_x', vim.tbl_extend("force", opts, { desc = "Delete without copying" }))

-- Scrolling and centering
map("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll down and center" }))
map("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll up and center" }))

-- Search and center
map("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result and center" }))
map("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result and center" }))

-- Paste without overwriting the unnamed register
map("v", "p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste without overwriting yank" }))

-- Command-line history navigation
map("c", "<C-j>", "<C-n>", vim.tbl_extend("force", opts, { desc = "Next command-line history item" }))
map("c", "<C-k>", "<C-p>", vim.tbl_extend("force", opts, { desc = "Previous command-line history item" }))

-- Floating terminal keymaps
local function open_terminal_in_root()
  local root_dir = vim.fn.getcwd()
  vim.cmd("terminal")
  vim.cmd("lcd " .. root_dir)
end
map(
  "n",
  "<leader>fT",
  open_terminal_in_root,
  vim.tbl_extend("force", opts, { desc = "Open terminal in root directory" })
)

local function open_terminal_in_cwd()
  LazyVim.terminal()
end
map(
  "n",
  "<leader>ft",
  open_terminal_in_cwd,
  vim.tbl_extend("force", opts, { desc = "Open terminal in current directory" })
)

-- Go-specific snippet
map(
  "i",
  "<C-e>",
  "if err != nil {\n\treturn $0 \n}",
  vim.tbl_extend("force", opts, { desc = "Insert Go error handling snippet" })
)

-- Ensure the keymap for "p" in visual mode is not overwritten by plugins
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy", -- Event after LazyVim is initialized
  callback = function()
    -- Reapply the keymap for "p" in visual mode
    vim.keymap.set("v", "p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste without overwriting yank" }))
  end,
})

-- Optional: Reapply the keymap when any buffer is opened (in case of buffer-specific overrides)
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   pattern = "*",
--   callback = function()
--     -- Ensure the keymap for "p" is set after opening any buffer
--     vim.keymap.set("v", "p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste without overwriting yank" }))
--   end,
-- })
