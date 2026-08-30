return {
    "keremimo/noctalia.nvim",
    main = "noctalia",
    lazy = false,
    enabled = true,
    priority = 100,
    opts = {
        palette_path = vim.fn.expand("~/.config/noctalia/colors-v4.json"),
        transparent = true,
    },
    config = function(_, opts)
        --require("noctalia").setup(opts)
        vim.cmd.colorscheme("noctalia")
    end,
}
