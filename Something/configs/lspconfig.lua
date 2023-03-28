local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("lspconfig").clangd.setup({
            cmd = {
                "clangd",
                "--background-index",
                "--offset-encoding=utf-16", -- temporary fix to stop null-ls
                "--enable-config",
                "--completion-style=detailed",
                "--clang-tidy",
                "--all-scopes-completion",
                "--pch-storage=memory",
                "--suggest-missing-includes",
            },
            on_attach = function(client, bufnr)
                -- client.server_capabilities.semanticTokensProvider = false
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
        })

-- 
-- lspconfig.pyright.setup { blabla}
