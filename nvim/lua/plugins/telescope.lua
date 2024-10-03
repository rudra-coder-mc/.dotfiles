return {
  "nvim-telescope/telescope.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next, -- next item in insert mode
            ["<C-k>"] = require("telescope.actions").move_selection_previous, -- previous item in insert mode
          },
          n = {
            ["j"] = require("telescope.actions").move_selection_next, -- next item in normal mode
            ["k"] = require("telescope.actions").move_selection_previous, -- previous item in normal mode
          },
        },
      },
    })
  end,
}
