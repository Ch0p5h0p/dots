return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local builtin = require("telescope.builtin")

        vim.api.nvim_create_user_command(
            'ManPages',
            function(opts)
                if opts.args == '' then
                    builtin.man_pages()
                else
                    builtin.man_pages({ sections = { opts.args } })
                end
            end,
            {
                desc = "Man page browser",
                nargs = '?'
            }
        )

        vim.api.nvim_create_user_command('M', function(opts) vim.cmd("ManPages "..opts.args) end, { desc = "Alias for ManPages", nargs = '?'})


        vim.keymap.set("n", "<leader>fb", function() vim.cmd("Telescope buffers") end, { desc = "Show all buffers" })
        vim.keymap.set("n", "<leader>ff", function() vim.cmd("Telescpe find_files") end, { desc = "Fuzzy find files" })
        vim.keymap.set("n", "<leader>fg", function() vim.cmd("Telescope live_grep") end, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fh", function() vim.cmd("Telescope help_tags") end, { desc = "Telescope help tags" })
        vim.keymap.set("n", "<leader>fk", function() vim.cmd("Telescope keymaps") end, { desc = "Keymap list" })
        vim.keymap.set("n", "<leader>fc", function() vim.cmd("Telescope commands") end, { desc = "Command list" })

    end
}
