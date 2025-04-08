return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (Root Dir)", remap = true },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
    {
      "<leader>fE",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
  opts = {
    window = {
      position = "right",
    },
  },
}
