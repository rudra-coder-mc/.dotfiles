return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    -- Add Codeium or any other dependencies here
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Use the default mapping and extend it
    opts.mapping = vim.tbl_deep_extend("force", opts.mapping or {}, {
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), -- Change <C-n> to <C-j>
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), -- Change <C-p> to <C-k>
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept the selected item
      -- Add more mappings as needed
    })

    return opts
  end,
}
