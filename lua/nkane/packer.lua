local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')

    use {
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
    }

    use('fatih/vim-go')
    use('neovim/nvim-lspconfig')
    use({
        'ray-x/go.nvim',
        requires = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        }
    })
    use({
        'crusj/structrue-go.nvim',
        branch = 'main',
    })
    use({
        'crusj/hierarchy-tree-go',
        requires = 'neovim/nvim-lspconfig',
    })

    use('ray-x/guihua.lua')
    use('mfussenegger/nvim-dap')
    use('mxsdev/nvim-dap-vscode-js')
    use('leoluz/nvim-dap-go')
    use('mfussenegger/nvim-dap-python')
    use({ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} })
    use ('mortepau/codicons.nvim')
    use('folke/neodev.nvim')
    use('theHamsta/nvim-dap-virtual-text')
    use('eandrju/cellular-automaton.nvim')
    use('ray-x/lsp_signature.nvim')
    use({
        'lewis6991/gitsigns.nvim',
    })
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use('raimondi/delimitMate')
    use('hrsh7th/nvim-compe')

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    use { 'tpope/vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-ui' }

    use('kdheepak/lazygit.nvim')

    use('nvim-tree/nvim-web-devicons')
    use('folke/trouble.nvim')
    use('hrsh7th/vim-vsnip')
    use('hrsh7th/vim-vsnip-integ')
    use({
        'L3MON4D3/LuaSnip',
        requires = {
            'rafamadriz/friendly-snippets'
        }
    })

    use {
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
