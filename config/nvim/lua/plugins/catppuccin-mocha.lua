return { 
    "catppuccin/nvim", 
    enabled = false,
    name = "catppuccin", 
    priority = 1000, 
    config = function(_, opts)
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    LineNr = { fg = colors.lavender },
                    CursorLineNr = { fg = colors.peach }
                }
            end
        })
        vim.cmd.colorscheme("catppuccin-nvim")
    end,
}
