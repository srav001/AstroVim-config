---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "float",
      },
    },
  },
  -- {
  --   "telescope.nvim",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --     build = "make",
  --     config = function() require("telescope").load_extension "fzf" end,
  --   },
  -- },

  {
    "echasnovski/mini.move",
    version = "*",
    config = function() require("mini.move").setup() end,
    event = "VeryLazy",
  },
  {
    "mg979/vim-visual-multi",
    event = "User AstroFile",
  },
}
