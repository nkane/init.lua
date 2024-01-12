return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_isntalled ={
                "c",
                "cpp",
                "go",
                "javascript",
                "typescript",
                "lua",
            },
            sync_install = true,
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
