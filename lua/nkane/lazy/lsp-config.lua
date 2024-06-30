return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            local util = require("lspconfig/util")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            })

            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })

            -- lspconfig.eslint.setup({
            --     capabilities = capabilities,
            -- })

            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })

            lspconfig.pylsp.setup({
                capabilities = capabilities,
            })

            lspconfig.marksman.setup({
                capabilities = capabilities,
                filetypes = { "md", "markdown" },
            })

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
            })

            vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {})
            vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {})
            --vim.keymap.set('n', '<leader>vf', vim.diagnostic.open_float, {})
            vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {})
            vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>vhh", vim.lsp.buf.signature_help, {})
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({})
        end,
    },
}
