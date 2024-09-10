require 'core.keymaps'
require 'core.options'
require 'core.snippets'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require('lazy').setup({

  require 'plugins.lualine',
  require 'plugins.vim-sleuth',
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lazydev',
  require 'plugins.luvit-meta',
  require 'plugins.conform',
  require 'plugins.nvim-com',
  require 'plugins.nvim-lspconfig',
  require 'plugins.nvim-treesitter',
  require 'plugins.theme-tokyonight',
  require 'plugins.undotree',
  require 'plugins.todo-comments',
  require 'plugins.mini',
  -- require 'plugins.debug',
  require 'plugins.indent_line',
  -- require 'plugins.lint',
  require 'plugins.autopairs',
  require 'plugins.neo-tree',
  require 'plugins.lazygit',
  require 'plugins.context-comment',
  require 'plugins.bufferline',
  -- { import = 'plugins' },
}, {
  ui = {
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
