vim.g.mapleader = ','

-- return to normal mode
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'Jk', '<Esc>')
vim.keymap.set('i', 'JK', '<Esc>')

-- toggle relative line numbers
vim.keymap.set('n', '<leader>r', function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get() end)

-- toggle word wrap
vim.keymap.set('n', '<leader>w', function()
    vim.opt.wrap = not vim.opt.wrap:get() end)
