local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('nkane.lazy')

--[[
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.4',
      requires = { {'nvim-lua/plenary.nvim'} }
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    {
        'nvim-treesitter/playground'
    },
    {
        'theprimeagen/harpoon'
    },
    {
        'mbbill/undotree'
    },
    {
        'tpope/vim-fugitive'
    },
    {
        'hrsh7th/nvim-cmp'
    },
    {'hrsh7th/cmp-nvim-lsp'},
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },
    {'fatih/vim-go'},
    {'neovim/nvim-lspconfig'},
    {
        'ray-x/go.nvim',
        requires = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        }
    },
    {
        'crusj/structrue-go.nvim',
        branch = 'main',
    },
    {
        'crusj/hierarchy-tree-go',
        requires = 'neovim/nvim-lspconfig',
    },
    {'ray-x/guihua.lua'},
    {'mfussenegger/nvim-dap'},
    {'mxsdev/nvim-dap-vscode-js'},
    {'leoluz/nvim-dap-go'},
    {'mfussenegger/nvim-dap-python'},
    {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
    },
    {
        'mortepau/codicons.nvim'
    },
    {'folke/neodev.nvim'},
    {'theHamsta/nvim-dap-virtual-text'},
    {'eandrju/cellular-automaton.nvim'},
    {'ray-x/lsp_signature.nvim'},
    {
        'lewis6991/gitsigns.nvim',
    },
    { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
    {'raimondi/delimitMate'},
    {'hrsh7th/nvim-compe'},
    {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    },
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
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }
}, {})
--]]
