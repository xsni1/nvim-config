-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "ellisonleao/gruvbox.nvim" }
    -- use 'morhetz/gruvbox'
    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- })
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-lua/plenary.nvim')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use('tpope/vim-sleuth')

    -- LSP ZERO
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'fatih/vim-go'
    -- use 'ray-x/go.nvim'
    use("petertriho/nvim-scrollbar")

    use 'ThePrimeagen/vim-be-good'

    use {
        "ray-x/lsp_signature.nvim",
    }

    use 'nvim-lualine/lualine.nvim'

    --use 'vim-airline/vim-airline'
    --use 'vim-airline/vim-airline-themes'
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                use_diagnostic_signs = true,
                mode = "workspace_diagnotics",
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- use 'nvim-tree/nvim-tree.lua'
    use 'tpope/vim-commentary'
    -- Packer
    use { 'sindrets/diffview.nvim' }
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })
    -- use 'karb94/neoscroll.nvim'
    use 'christoomey/vim-tmux-navigator'

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    -- use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    use "rebelot/kanagawa.nvim"
    use 'AlexvZyl/nordic.nvim'
    use "savq/melange-nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    use "EdenEast/nightfox.nvim" -- Packer
    use 'ayu-theme/ayu-vim'

    use 'nvim-treesitter/nvim-treesitter-context'

    use 'tpope/vim-surround'

    use 'RRethy/vim-illuminate'

    use({ 'rose-pine/neovim', as = 'rose-pine' })
end)
