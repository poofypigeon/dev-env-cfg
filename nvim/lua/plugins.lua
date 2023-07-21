-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }

    use {
        'numToStr/Navigator.nvim',
        config = function()
            require('Navigator').setup()
            vim.keymap.set('n', '<C-h>', vim.cmd.NavigatorLeft)
            vim.keymap.set('n', '<C-l>', vim.cmd.NavigatorRight)
            vim.keymap.set('n', '<C-k>', vim.cmd.NavigatorUp)
            vim.keymap.set('n', '<C-j>', vim.cmd.NavigatorDown)
        end
    }

    use {
        'shaunsingh/nord.nvim',
        config = function() 
            -- vim.g.nord_borders = true
            -- vim.opt.fillchars = 'vert:▎'
            require('nord').set()
        end
    }

    use {
        'ibhagwan/fzf-lua',
        config = function()
            local nord = require('nord.named_colors')

            require('fzf-lua').setup {
                global_git_icons = false,
                global_file_icons = false,
                fzf_opts ={},
                winopts = { border = 'thicc' },
                preview = {
                    scrollbar = 'float',
                    scrolloff = '-2',
                    title_pos = 'left'
                },
                fzf_colors = {
                    ['fg']      = nord.darkest_white,
                    ['fg+']     = nord.white,
                    ['bg']      = nord.black,
                    ['bg+']     = nord.black,
                    ['gutter']  = nord.black,
                    ['info']    = nord.light_gray,
                    ['header']  = nord.black,
                    ['marker']  = nord.light_gray,
                    ['pointer'] = nord.red,
                    ['prompt']  = nord.off_blue,
                    ['hl']      = nord.white,
                    ['hl+']     = nord.white

                }
            }

            vim.api.nvim_set_hl(0, "FzfLuaBorder",        { fg = nord.light_gray })
            vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { fg = nord.light_gray })

            vim.keymap.set('n', '<leader>f', require('fzf-lua').files)
            vim.keymap.set('n', '<leader>b', require('fzf-lua').buffers)
            vim.keymap.set('n', '<leader>l', require('fzf-lua').lines)
        end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        after = 'nord.nvim',
        config = function()
            vim.g.indent_blankline_char = '▏'
            require("indent_blankline").setup()
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        after = 'nord.nvim',
        config = function()
            local nord = require('nord.named_colors')
            local custom_nord = require('lualine.themes.nord')

            custom_nord.normal.c.bg = nord.black

            require('lualine').setup {
                options = {
                    theme = custom_nord,
                    icons_enabled = false,
                    component_separators = '|',
                    section_separators = { left = '', right = '' },
                    globalstatus = true
                },
                sections = {
                    lualine_a = {
                        { 
                            function() return ' ' end, 
                            color = { bg = nord.black },
                            padding = { right = 0, left = 0 }
                        },
                        { 
                            'mode',
                            separator = { left = '', right = '' }
                        },
                    },
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {
                        {
                            'location',
                            separator = { left = '', right = '' }
                        },
                        {
                            function() return ' ' end,
                            color = { bg = nord.black },
                            padding = { right = 0, left = 0 }
                        }
                    }
                },
            }
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                toggler = {
                    line = '<leader>/',
                    block = nil
                },
                opleader = {
                    line = '<leader>/',
                    block = nil
                },
                mappings = {
                    basic = true,
                    extra = false
                }
            }
        end
    }

    use {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>z', vim.cmd.UndotreeToggle)
        end
    }

    use {
        'neoclide/coc.nvim',
        branch = 'release'
    }

    use {
        'ziglang/zig.vim',
        ft = { 'zig' }
    }

    -- use { 'sakhnik/nvim-gdb' }

end)
