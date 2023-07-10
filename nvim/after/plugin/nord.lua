vim.cmd[[colorscheme nord]]
vim.g.nord_borders = true
require('nord').set()

-- lualine must be called after colorscheme
require('lualine').setup()

vim.opt.cursorline = true

local nord = {
    '#2E3440', '#3B4252', '#434C5E', '#4C566A',
    '#D8DEE9', '#E5E9F0', '#ECEFF4', '#8FBCBB',
    '#88C0D0', '#81A1C1', '#5E81AC', '#BF616A',
    '#D08770', '#EBCB8B', '#A3BE8C', '#B48EAD'
}

for i, clr in ipairs(nord) do
    vim.api.nvim_set_hl(0, 'Nord'..(i - 1),  { bg = nord[i],  fg = nord[i] })
end

require('fzf-lua').setup{
    global_git_icons = false,
    global_file_icons = false,
    fzf_opts ={},
    winopts = {
        fullscreen = true,
        border = 'thicc'
    },
    preview = {
        scrollbar = 'float',
        scrolloff = '-2',
        title_pos = 'left'
    },
    fzf_colors = {
        ['fg']      = {'fg', 'Nord4' },
        ['fg+']     = {'fg', 'Nord6' },
        ['bg']      = {'fg', 'Nord0' },
        ['bg+']     = {'fg', 'Nord0' },
        ['gutter']  = {'fg', 'Nord0' },
        ['info']    = {'fg', 'Nord9' },
        ['header']  = {'fg', 'Nord11'},
        ['marker']  = {'fg', 'Nord15'},
        ['pointer'] = {'fg', 'Nord11'},
        ['prompt']  = {'fg', 'Nord8' },
        ['hl']      = {'fg', 'Nord7' },
        ['hl+']     = {'fg', 'Nord7' }

    }
}

vim.api.nvim_set_hl(0, "FzfLuaBorder",        { fg = nord[1] })
vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { fg = nord[4] })

vim.keymap.set('n', '<leader>f', require('fzf-lua').files)
