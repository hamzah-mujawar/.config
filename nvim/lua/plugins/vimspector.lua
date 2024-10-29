vim.g.vimspector_enable_mappings = 'HUMAN'
return {
    "puremourning/vimspector",
    config = function()
        -- Define key mappings
        vim.api.nvim_set_keymap('n', '<leader>qq', ':call vimspector#Launch()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>qr', ':VimspectorReset<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>qe', ':VimspectorEval<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>qw', ':VimspectorWatch<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>qo', ':VimspectorShowOutput<CR>', { noremap = true, silent = true })
    end,
}

