return {
  'hrsh7th/nvim-cmp',
  version = false, -- Use the latest version of nvim-cmp
  event = 'InsertEnter', -- Load when entering insert mode to optimize performance
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- For LSP completions
    'hrsh7th/cmp-buffer', -- For buffer completions
    'hrsh7th/cmp-path', -- For path completions
    'L3MON4D3/LuaSnip', -- Snippet engine
    'saadparwaiz1/cmp_luasnip', -- Snippet completions
    'rafamadriz/friendly-snippets', -- A large collection of snippets
  },

  opts = function()
    -- Set a custom highlight group for ghost text
    vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

    -- Load required modules
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    -- Option to toggle automatic selection of the first completion item
    local auto_select = true

    return {
      -- Configure automatic bracket completion for specific languages
      auto_brackets = {},

      -- Customize completion menu options
      completion = {
        completeopt = 'menu,menuone,noinsert' .. (auto_select and '' or ',noselect'), -- Use 'noselect' based on auto_select
      },

      -- Set preselect behavior (whether the first item is preselected)
      preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,

      -- Mappings for completion navigation, confirmation, and manual trigger
      mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
        ['<C-u>'] = cmp.mapping.scroll_docs(4), -- Scroll docs down
        ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, -- Select next completion item
        ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, -- Select previous completion item
        ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger completion
        --[[ ['<CR>'] = cmp.mapping.confirm { select = auto_select }, -- Confirm selection (auto-select item if configured) ]]
        ['<C-y>'] = cmp.mapping.confirm { select = true }, -- Always confirm selection
        ['<S-CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace }, -- Replace text with the confirmed item
        ['<C-CR>'] = function(fallback)
          cmp.abort() -- Cancel completion
          fallback() -- Proceed with normal behavior
        end,
      },

      -- Define completion sources
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- LSP completions
        { name = 'path' }, -- File path completions
      }, {
        { name = 'buffer' }, -- Buffer completions as fallback
        { name = 'luasnip' }, -- Snippet completions
      }),

      -- Formatting the completion menu items
      formatting = {
        format = function(entry, item)
          -- Add icons for completion kinds (functions, variables, etc.)
          local icons = {
            Text = '',
            Method = '',
            Function = '',
            Constructor = '',
            Field = '',
            Variable = '',
            Class = '',
            Interface = '',
            Module = '',
            Property = '',
            Unit = '',
            Value = '',
            Enum = '',
            Keyword = '',
            Snippet = '',
            Color = '',
            File = '',
            Reference = '',
            Folder = '',
            EnumMember = '',
            Constant = '',
            Struct = '',
            Event = '',
            Operator = '',
            TypeParameter = '',
          }

          -- Prepend the icon to the completion kind
          item.kind = string.format('%s %s', icons[item.kind] or '', item.kind)

          -- Truncate long completion items
          if #item.abbr > 40 then
            item.abbr = string.sub(item.abbr, 1, 37) .. '...'
          end

          return item
        end,
      },

      -- Enable ghost text (preview of the selected completion inline)
      experimental = {
        ghost_text = {
          hl_group = 'CmpGhostText', -- Use custom highlight for ghost text
        },
      },

      -- Sorting configuration can be customized here if needed
      sorting = cmp.config.default().sorting,
    }
  end,
}
