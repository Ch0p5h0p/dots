return {
    "kelly-lin/ranger.nvim",
    opts = {
        enable_cmds = true,
        replace_netrw = true,
        keybinds = {},
        ui = {
            border = "none",
            height = 1,
            width = 1,
            x = 0.5,
            y = 0.5,
        }

    },
    config = function(opts)
        local ranger = require("ranger-nvim")
        ranger.setup(opts)
        vim.api.nvim_set_keymap("n", "<leader>ef", "", {
            noremap = true,
            callback = function()
                require("ranger-nvim").open(true)
            end,
        })

        vim.api.nvim_create_user_command('Ranger', function() ranger.open(true) end, {desc = "Open Ranger", nargs = '?'})

        vim.api.nvim_create_user_command('R', function(opts) vim.cmd("Ranger "..opts.args) end, {desc = "Alias for Ranger", nargs = '?'})
    end,
}
