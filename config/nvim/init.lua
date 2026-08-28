require("config.lazy")
require("lazy").setup("plugins")

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",           -- C and C++
        "jdtls",            -- Java
        --"ocamllsp",         -- OCaml
        "rust_analyzer",    -- Rust
        "pyright",          -- Python
        "asm_lsp",          -- Assembly
        "hls",              -- Haskell
        --"checkmake",        -- Make
    }
})

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                'WinEnter',
                'BufEnter',
                'BufWritePost',
                'SessionLoadPost',
                'FileChangedShellPost',
                'VimResized',
                'Filetype',
                'CursorMoved',
                'CursorMovedI',
                'ModeChanged',
            },
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'buffers', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

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

--[[mason_lspconfig.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({})
    end,
})]]

local ranger_nvim = require("ranger-nvim")
ranger_nvim.setup({
    enable_cmds = true,
    replace_netrw = true,
    keybinds = {
        ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
        ["oh"] = ranger_nvim.OPEN_MODE.split,
        ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
        ["or"] = ranger_nvim.OPEN_MODE.rifle,
    },
    ui = {
        border = "none",
        height = 1,
        width = 1,
        x = 0.5,
        y = 0.5,
    }
})

local builtin = require("telescope.builtin")

vim.api.nvim_create_user_command(
    'ManPages',
    function(opts)
        if opts.args == '' then
            builtin.man_pages()
        else
            builtin.man_pages({ sections = {opts.args } })
        end
    end,
    {
        desc = "Man page browser",
        nargs = '?'
    }
)


vim.api.nvim_create_user_command('M', function(opts) vim.cmd("ManPages "..opts.args) end, { desc = "Alias for ManPages", nargs = '?'})
vim.api.nvim_create_user_command('Ex', function(opts) vim.cmd("Ranger "..opts.args) end, {desc = "Ranger alias", nargs = '?'})
vim.api.nvim_create_user_command('D', function(opts) vim.cmd("Dashboard") end, {desc = "Dashboard alias", nargs = '?'})
vim.api.nvim_create_user_command('Econf', function(opts) vim.cmd("e ~/.config/nvim/init.lua") end, {desc = "Edit NeoVim config", nargs = 0})

vim.api.nvim_create_user_command('CRun', function()
    local cmd = vim.fn.input("Command: ")
    if cmd ~= nil and cmd ~= "" then
        vim.cmd("split | terminal "..cmd)
    end
end, {})

--[[vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})]]

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

vim.lsp.config("jdtls", {
    settings = {
        java ={},
    },
})
vim.lsp.enable("jdtls")
vim.lsp.enable("clangd")

vim.cmd.colorscheme "catppuccin-nvim"

vim.cmd([[Screenkey]])
vim.cmd([[cd ~]])
