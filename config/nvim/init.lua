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
        --"checkmake",        -- Makefiles
    }
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

--[[require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},

	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})]]

--require("oil").setup()

vim.api.nvim_create_user_command('M', function(opts) vim.cmd("ManPages "..opts.args) end, { desc = "Alias for ManPages", nargs = '?'})

vim.api.nvim_create_user_command('Ex', function(opts) vim.cmd("Ranger "..opts.args) end, {desc = "Ranger alias", nargs = '?'})

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

vim.lsp.config("jdtls", {
    settings = {
        java ={},
    },
})
vim.lsp.enable("jdtls")
vim.lsp.enable("clangd")

vim.cmd([[cd ~]])
