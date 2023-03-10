local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspformat = require("lsp-format")

vim.diagnostic.config({ signs = false })

-- bash
lspconfig.bashls.setup({
    on_attach = lspformat.on_attach,
    capabilities = capabilities
})

-- c and c++
lspconfig.clangd.setup({
    on_attach = lspformat.on_attach,
    capabilities = capabilities
})

-- go
lspconfig.gopls.setup({
    on_attach = lspformat.on_attach,
    capabilities = capabilities
})

-- lua
lspconfig.lua_ls.setup({
    on_attach = lspformat.on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "2"
                }
            },
            diagnostics = {
                globals = { "vim" }
            },
            telemetry = {
                enable = false
            }
        }
    }
})
