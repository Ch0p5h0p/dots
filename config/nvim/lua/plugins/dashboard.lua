return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        db = require("dashboard")
        db.setup({
            theme = 'doom',
            config = {
                header = {
                    "",
                    "",
                    "",
                    "⠀⣀⣀⣀⡀⠀⠀⠀⠀⣀⣤⣶⣶⣾⣿⣿⣿⣷⣶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀",
                    "⣾⣿⠛⠛⠛⠛⢶⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀",
                    "⢹⣿⡀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⠛⣿⣷⣄⠀⠀⠀",
                    "⠀⢻⣷⣀⣾⣿⡟⠁⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⣸⣿⣿⣆⠀⠀",
                    "⠀⠀⠙⠁⠻⣿⣿⣿⣿⣦⣄⠀⠀⠙⢿⣿⣿⣿⣄⠀⠀⢀⠠⠊⠀⠀⠹⣿⡇⠀",
                    "⠀⠀⢰⣷⡄⠈⢿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠉⠛⢿⣶⡖⠁⠀⠀⠀⢀⣴⣿⣿⠀",
                    "⠀⠀⣾⣿⣿⣦⡀⠙⢿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠹⣷⣄⠀⣠⠔⠛⠻⣿⣿⡇",
                    "⠀⠀⢻⣿⣿⣿⣿⣦⡀⠙⢿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠹⣿⣟⠁⠀⠀⠀⣽⣿⠃",
                    "⠀⠀⠘⣿⣿⣿⣿⣿⣿⣦⡀⠉⠻⡿⠁⠀⠀⠀⠀⠀⠀⣿⣿⣦⣤⣤⣾⣿⡟⠀",
                    "⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠃⠀",
                    "⠀⠀⠀⠀⠙⢿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⡿⢻⡄⠀",
                    "⠀⠀⠀⠀⠀⠈⠻⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⡿⠋⠀⠀⢻⡄",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣿⣷⣦⡄⣨⣯⣄⡀⠀⠀⢀⣿",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠛⠛⠋⠉⠀⠀⠀⠉⠙⠻⠿⠿⠿⠋",
                    "",
                    "",
                    "",

                }, 
                center = {
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'File explorer',
                        desc_hl = 'String',
                        key = 'f',
                        --keymap = 'f',
                        key_hl = 'Number',
                        key_format = "[f]",
                        action = 'Ranger'
                        --action = 'Ex'
                        --action = 'Oil'
                    },
                    {
                        icon = " ",
                        icon_hl = 'Title',
                        desc = 'New file',
                        desc_hl = 'String',
                        key = 'n',
                        key_hl = 'Number',
                        key_format = "[%s]",
                        action = 'enew'
                    },
                    {
                        icon = " ",
                        icon_hl = 'Title',
                        desc = 'VimBeGood',
                        desc_hl = 'String',
                        key = 'v',
                        key_hl = 'Number',
                        key_format = "[%s]",
                        action = 'VimBeGood'
                    },
                    {
                        icon = " ",
                        icon_hl = 'Title',
                        desc = 'Browse man pages',
                        desc_hl = 'String',
                        key = 'm',
                        key_hl = 'Number',
                        key_format = "[%s]",
                        action = function()
                            local section = vim.fn.input("Man section (1-8, default = 1): ")
                            if section == "" then
                                vim.cmd("ManPages")
                            else
                                vim.cmd("ManPages "..section)
                            end
                        end,
                    },
                    {
                        icon = " ",
                        icon_hl = 'Title',
                        desc = 'Quit',
                        desc_hl = 'String',
                        key = 'q',
                        key_hl = 'Number',
                        key_format = "[%s]",
                        action = 'q'
                    },
                },
                footer = {
                    "",
                    "",
                    "[[ good luck, have fish ]]",
                    "         ~Drift           ",
                }
            }
        })

        vim.api.nvim_create_user_command('D', function(opts) vim.cmd("Dashboard") end, {desc = "Dashboard alias", nargs = '?'})
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
