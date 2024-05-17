return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    [";"] = { ":", desc = "enter command mode" },

    -- Move through buffers with tab and Stab
    ["<tab>"] = {
      "<cmd>bnext<cr>",
      desc = "Next buffer",
    },
    ["<S-tab>"] = {
      "<cmd>bprevious<cr>",
      desc = "Previous buffer",
    },
    --
    -- NOTE TO SELF: Stop adding options that override sane defaults
    -- Adding goToDef manually since using lsp-inlayhints require lsp config which resets these defaults for lsps
    ["gD"] = {
      function() vim.lsp.buf.declaration() end,
      desc = "LSP declaration",
    },

    ["gd"] = {
      function() vim.lsp.buf.definition() end,
      desc = "LSP definition",
    },

    ["K"] = {
      function() vim.lsp.buf.hover() end,
      desc = "LSP hover",
    },

    ["ci"] = {
      function() vim.lsp.buf.implementation() end,
      desc = "LSP implementation",
    },

    ["gr"] = {
      function() vim.lsp.buf.references() end,
      desc = "LSP references",
    },

    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", desc = "Find in current buffer" },

    ["<leader>r"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP" },
    ["r"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP" },
    ["R"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP" },
  },

  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", desc = "Beginning of line" },
    ["<C-e>"] = { "<End>", desc = "End of line" },
  },
}
