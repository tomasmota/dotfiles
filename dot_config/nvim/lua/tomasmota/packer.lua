-- Packer Bootstrap
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
    use 'wbthomason/packer.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Themes
    use 'EdenEast/nightfox.nvim'

    -- Telescope
    -- requires https://github.com/BurntSushi/ripgrep
    -- requires https://github.com/sharkdp/fd (sudo apt install fd-find)
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'}, { "nvim-telescope/telescope-live-grep-args.nvim" } }
    }
    -- requires locate (sudo apt install locate)
    use 'cljoly/telescope-repo.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        'folke/todo-comments.nvim',
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {}
        end
    }

    -- Lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
          require('lualine').setup({
            sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                }
            }
        })
        end
    }

    -- Git stuff
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use { 'sindrets/diffview.nvim' }

    use {'rcarriga/nvim-notify'}

    use {
        'dmmulroy/tsc.nvim',
        config = function()
            require('tsc').setup()
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    ---

    -- use { 'airblade/vim-rooter' } -- change neovim root

    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons',
    --     },
    --     config = function()
    --         require("nvim-tree").setup {}
    --     end
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
