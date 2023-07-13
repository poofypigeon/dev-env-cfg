-- unmap <C-l> so that window navigation works as expected
vim.api.nvim_create_autocmd("FileType", {
    pattern = 'netrw',
    callback = function()
        if vim.fn.maparg('<C-l>', 'n', false, true).buffer == 1 then
            vim.keymap.del('n', '<C-l>', { buffer = true })
        end
    end
})

-- set a flag when a non-netrw buffer is loaded
-- this indicates that there is a valid buffer to return to
vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function()
        if vim.bo.filetype ~= 'netrw' and vim.fn.bufname() ~= '' then
            vim.w.canreturn = true
        end
    end
})

vim.keymap.set('n', '<leader>e', function()
    if vim.bo.filetype ~= 'netrw' then 
        vim.cmd.Explore({bang = true})
    elseif vim.w.canreturn then
        vim.cmd.Rexplore()
    else
        vim.cmd.wincmd('q')
    end
end)

vim.keymap.set('n', '<leader>s', function() vim.cmd.Sexplore{ bang = true } end)
