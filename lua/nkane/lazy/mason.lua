return {
    {
        'williamboman/mason.nvim',
        version = 'v1.10.0',
        config = function()
            require('mason').setup({})
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        version = 'v1.27.0',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'gopls',
                    'pylsp'
                }
            })
        end
    }
}
