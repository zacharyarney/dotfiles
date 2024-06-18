return {
    enabled = false,
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require('harpoon')
        local opts = { noremap = true, silent = true }

        harpoon.setup {}

        vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, opts)
        vim.keymap.set('n', '<C-h>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)

        vim.g.BASH_Ctrl_j = 'off'
        vim.keymap.set('n', '<C-1>', function() harpoon:list():select(1) end, opts)
        vim.keymap.set('n', '<C-2>', function() harpoon:list():select(2) end, opts)
        vim.keymap.set('n', '<C-3>', function() harpoon:list():select(3) end, opts)
        vim.keymap.set('n', '<C-4>', function() harpoon:list():select(4) end, opts)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end, opts)
        vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end, opts)
    end
}
