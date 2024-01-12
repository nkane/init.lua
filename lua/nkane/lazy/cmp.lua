return {
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('cmp').setup({})
        end
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        config = function()
            require('cmp_nvim_lsp').setup({})
        end
    }
}
