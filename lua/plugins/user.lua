-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "lvimuser/lsp-inlayhints.nvim",
    lazy = false,
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          LspAttach_inlayhints = {},
          LspAttach = {
            {
              event = "LspAttach",
              group = "LspAttach_inlayhints",
              callback = function(args)
                if not (args.data and args.data.client_id) then return end

                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                require("lsp-inlayhints").on_attach(client, bufnr)
              end,
            },
          },
        },
      },
    },
    opts = {},
  },
  {
    "js-everts/cmp-tailwind-colors",
    event = "InsertEnter",
    opts = {},
  },
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
  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    cmd = { "Copilot" },
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          dismiss = "<C-]>",
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    lazy = true,
    config = true,
  },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
}
