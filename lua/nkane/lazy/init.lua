return {
    {
        'nvim-lua/plenary.nvim',
        name = 'plenary'
    },
    {
        'nvim-treesitter/playground'
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        end
    },
    {
        'hrsh7th/nvim-cmp'
    },
    {
        'tpope/vim-fugitive'
    },
    {
        'hrsh7th/nvim-cmp'
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'neovim/nvim-lspconfig'
    },
    {
        'williamboman/mason.nvim'
    },
    {
        'williamboman/mason-lspconfig.nvim'
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    {
        'saadparwaiz1/cmp_luasnip',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
    {
        'fatih/vim-go',
        config = function()
            require('go').setup({})
        end
    },
    { 'ray-x/guihua.lua' },
    { 'nvim-treesitter/nvim-treesitter' },
    {
        'ray-x/go.nvim',
    },
    {
        'crusj/structrue-go.nvim',
        branch = 'main',
        config = function()
            require('structrue-go').setup()
        end
    },
    {
        'crusj/hierarchy-tree-go',
        config = function()
            require('hierarchy-tree-go').setup({})
        end
    },
    { 'ray-x/guihua.lua' },
    { 'mxsdev/nvim-dap-vscode-js'},
    { 'leoluz/nvim-dap-go' },
    { 'mfussenegger/nvim-dap-python' },
    {
        'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap' },
        config = function()
            require('dapui').setup({});
            vim.keymap.set('n', '<F8>', require 'dapui'.toggle)
            vim.keymap.set('i', '<F8>', require 'dapui'.toggle)
        end
    },
    {
        'mortepau/codicons.nvim',
        config = function()
            local codicons = require('codicons')
            codicons.setup({
                -- Override by mapping name to icon
                ['account'] = '',
                -- Or by name to hexadecimal/decimal value
                ['comment'] = 0xEA6B, -- hexadecimal
                ['archive'] = 60056, -- decimal
            })
        end
    },
    { 'folke/neodev.nvim' },
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require('nvim-dap-virtual-text').setup()
        end
    },
    { 'eandrju/cellular-automaton.nvim' },
    {
        'ray-x/lsp_signature.nvim',
        config = function()
            require('lsp_signature').setup({})
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('diffview').setup({})
        end
    },
    { 'raimondi/delimitMate' },
    { 'hrsh7th/nvim-compe' },
    { 'tpope/vim-dadbod' },
    { 'kristijanhusak/vim-dadbod-ui' },
    { 'kdheepak/lazygit.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'folke/trouble.nvim' },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/vim-vsnip-integ' },
    {
        'L3MON4D3/LuaSnip',
        requires = {
            'rafamadriz/friendly-snippets'
        }
    },
    {
        'microsoft/vscode-js-debug',
        opt = true,
        run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
    }
}
