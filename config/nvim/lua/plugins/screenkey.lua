return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
    config = function()
        vim.keymap.set("n", "<leader>s", function() vim.cmd("Screenkey") end, { desc = "Toggle Screenkey" })
    end,
}
