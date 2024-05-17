-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = true, -- enable or disable auto formatting on start
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        "volar",
      },
      timeout_ms = 1200, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
    },
    -- customize how language servers are attached
    handlers = {
      vtsls = function(serverName, configOpts)
        require("lspconfig")[serverName].setup(configOpts)

        configOpts.settings = {
          vtsls = {
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          javascript = {
            format = {
              indentSize = vim.o.shiftwidth,
              convertTabsToSpaces = vim.o.expandtab,
              tabSize = vim.o.tabstop,
            },
            -- enables inline hints
            inlayHints = {
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
            -- otherwise it would ask every time if you want to update imports, which is a bit annoying
            updateImportsOnFileMove = {
              enabled = "always",
            },
          },
          typescript = {
            format = {
              indentSize = vim.o.shiftwidth,
              convertTabsToSpaces = vim.o.expandtab,
              tabSize = vim.o.tabstop,
            },
            updateImportsOnFileMove = {
              enabled = "always",
            },
            inlayHints = {
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
        }
      end,

      -- tsserver = function(serverName, configOpts)
      --   require("lspconfig")[serverName].setup(configOpts)
      --
      --   configOpts.settings = {
      --     typescript = {
      --       inlayHints = {
      --         includeInlayParameterNameHints = "all",
      --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --         includeInlayFunctionParameterTypeHints = true,
      --         includeInlayVariableTypeHints = true,
      --         includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      --         includeInlayPropertyDeclarationTypeHints = true,
      --         includeInlayFunctionLikeReturnTypeHints = true,
      --         includeInlayEnumMemberValueHints = true,
      --       },
      --     },
      --     javascript = {
      --       inlayHints = {
      --         includeInlayParameterNameHints = "all",
      --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --         includeInlayFunctionParameterTypeHints = true,
      --         includeInlayVariableTypeHints = true,
      --         includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      --         includeInlayPropertyDeclarationTypeHints = true,
      --         includeInlayFunctionLikeReturnTypeHints = true,
      --         includeInlayEnumMemberValueHints = true,
      --       },
      --     },
      --   }
      -- end,
      -- volar = function(_, configOpts)
      --    require("lspconfig")[serverName].setup(configOpts)
      --    configOpts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
      --    configOpts.settings = {
      --     typescript = {
      --       inlayHints = {
      --         enumMemberValues = {
      --           enabled = true,
      --         },
      --         functionLikeReturnTypes = {
      --           enabled = true,
      --         },
      --         includeInlayFunctionParameterTypeHints = {
      --           enabled = true,
      --         },
      --         parameterNames = {
      --           enabled = true,
      --           suppressWhenArgumentMatchesName = true,
      --         },
      --         parameterTypes = {
      --           enabled = true,
      --         },
      --         propertyDeclarationTypes = {
      --           enabled = true,
      --         },
      --         includeInlayFunctionLikeReturnTypeHints = {
      --           enabled = true,
      --         },
      --         variableTypes = {
      --           enabled = true,
      --         },
      --       },
      --     },
      --     javascript = {
      --       inlayHints = {
      --         enumMemberValues = {
      --           enabled = true,
      --         },
      --         functionLikeReturnTypes = {
      --           enabled = true,
      --         },
      --         includeInlayFunctionParameterTypeHints = {
      --           enabled = true,
      --         },
      --         parameterNames = {
      --           enabled = true,
      --           suppressWhenArgumentMatchesName = true,
      --         },
      --         parameterTypes = {
      --           enabled = true,
      --         },
      --         propertyDeclarationTypes = {
      --           enabled = true,
      --         },
      --         includeInlayFunctionLikeReturnTypeHints = {
      --           enabled = true,
      --         },
      --         variableTypes = {
      --           enabled = true,
      --         },
      --       },
      --     },
      --   }
      --
      --   return configOpts
      -- end,

      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- first key is the `augroup` to add the auto commands to (:h augroup)
      lsp_document_highlight = {
        -- Optional condition to create/delete auto command group
        -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
        -- condition will be resolved for each client on each execution and if it ever fails for all clients,
        -- the auto commands will be deleted for that buffer
        cond = "textDocument/documentHighlight",
        -- cond = function(client, bufnr) return client.name == "lua_ls" end,
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "CursorHold", "CursorHoldI" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "Document Highlighting",
          callback = function() vim.lsp.buf.document_highlight() end,
        },
        {
          event = { "CursorMoved", "CursorMovedI", "BufLeave" },
          desc = "Document Highlighting Clear",
          callback = function() vim.lsp.buf.clear_references() end,
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        -- gD = {
        --   function() vim.lsp.buf.declaration() end,
        --   desc = "Declaration of current symbol",
        --   cond = "textDocument/declaration",
        -- },
        -- ["<Leader>uY"] = {
        --   function() require("astrolsp.toggles").buffer_semantic_tokens() end,
        --   desc = "Toggle LSP semantic highlight (buffer)",
        --   cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
        -- },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
