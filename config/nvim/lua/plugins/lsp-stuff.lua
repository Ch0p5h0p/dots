--[[return {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim" },
}]]

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("jdtls", {
                settings = {
                    java = {},
                },
            })

            vim.lsp.enable({
                "jdtls",
                "clangd",
                "rust_analyzer",
                "pyright",
                "asm_lsp",
                "hls",
            })
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {},
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "jdtls",
                "rust_analyzer",
                "pyright",
                "asm_lsp",
                "hls",
            },
        },
    },
}
