return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require('telescope').setup({})
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>gf', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = 'Telescope help tags' })
    end 
}
