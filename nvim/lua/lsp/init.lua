-- default config for all servers
vim.lsp.config("*", {
    on_attach = function(client, bufnr)
        -- enable inlay hint
        vim.lsp.inlay_hint.enable(true)

        -- completion
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })

        -- diagnostic signs
        vim.diagnostic.config { virtual_text = true, underline = true }

        -- mappings.
        -- see `:help vim.lsp.*` for documentation on any of the below functions
        -- lsp navigation keymaps, use default wherever possible

        -- diagnostics list
        vim.keymap.set("n", "<Space>xx", function()
            vim.diagnostic.setqflist { severity = vim.diagnostic.severity.ERROR }
        end)
    end,
    detached = true,
})

-- load config for servers
require("lsp.clangd")
require("lsp.zls")
require("lsp.gopls")
require("lsp.tsserver")
require("lsp.pylsp")

-- can be disabled by `:lua vim.lsp.enable("tsserver", false)` for example
vim.lsp.enable({ "clangd", "zls", "gopls", "tsserver", "pylsp" })
