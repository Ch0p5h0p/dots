-- Ch0p5h0p's NeoVim config

vim.g.mapleader = " "

require("config.lazy")
require("lazy").setup("plugins")

vim.api.nvim_create_user_command('Econf', function(opts) vim.cmd("e ~/.config/nvim/init.lua") end, {desc = "Edit NeoVim config", nargs = 0})

vim.diagnostic.config({
    float = {
        border = "rounded",
        focusable = false,
        style = "minimal",
        source = "always",
        header = { "Diagnostics", "Normal" },
        prefix = " ",
    },
})

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

vim.o.updatetime = 300

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { desc = "Go to next error" })
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { desc = "Go to previous error" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line error" })

vim.opt.termguicolors = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd.colorscheme "catppuccin-nvim"

--vim.cmd([[Screenkey]])
vim.cmd([[cd ~]])
