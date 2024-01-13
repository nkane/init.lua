return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup({
            auto_install = true,
            highlight = {
                enabled = true
            },
            indent = {
                enabled = true
            }
        })
    end
}
