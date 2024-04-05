-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.wo.linebreak = true
vim.wo.list = false

local lspconfig = require "lspconfig"

-- Eslint auto fix command
if lspconfig.eslint then
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.vue", "*.svelte", "*.astro" },
    command = "silent! EslintFixAll",
    group = vim.api.nvim_create_augroup("MyAutocmdsForEslintAutoFix", {}),
  })
end
