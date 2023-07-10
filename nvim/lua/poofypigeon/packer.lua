-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use {
    --     'nvim-telescope/telescope.nvim', tag = '0.1.2',
    --     requires = { {'nvim-lua/plenary.nvim'} }
    -- }

    use {
        "ibhagwan/fzf-lua",
        requires = { "nvim-tree/nvim-web-devicons" }
    }

    use 'shaunsingh/nord.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'ggandor/leap.nvim'

    use 'alexghergh/nvim-tmux-navigation'

    use 'numToStr/Comment.nvim' 
end)
