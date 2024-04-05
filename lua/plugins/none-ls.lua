---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier.with {
        filetypes = {
          "html",
          "markdown",
          "css",
          "scss",
          "vue",
          "svelte",
          "typescript",
          "javascript",
          "json",
          "astro",
          "typescriptreact",
          "javascriptreact",
        },
      },
    }
    return config -- return final config table
  end,
}
