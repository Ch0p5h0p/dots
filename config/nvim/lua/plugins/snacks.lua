return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- personal configuration goes here
		-- leave empty to use defaults
		bigfile = {enabled = false},
		dashboard = {enabled = false},
		explorer = {enabled = true},
		indent = {enabled = false},
		input = {enabled = false},
		picker = {enabled = true},
		notifier = {enabled = false},
		quickfile = {enabled = false},
		scope = {enabled = false},
		scroll = {enabled = false},
		statuscolumn = {enabled = false},
		words = {enabled = false},	
	},
	keys = {
		--{"p", function() Snacks.picker.smart() end, desc = "Smart picker" },
		--{"e", function() Snacks.explorer() end, desc = "File explorer" },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- globals for debugging
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end

				if vim.fn.has("nvim-0.11") == 1 then
					vim._print = function(_, ...)
						dd(...)
					end
				else
					vim.print = _G.dd
				end
			end,
		})
	end,
}
