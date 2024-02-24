return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		config = function(_)
			vim.opt.termguicolors = true
			require("onedarkpro").setup({
				options = {
					cursorline = true,
					transparency = true,
				},
				styles = {
					types = "NONE",
					methods = "NONE",
					numbers = "NONE",
					strings = "NONE",
					comments = "italic",
					keywords = "bold,italic",
					constants = "NONE",
					functions = "italic",
					operators = "NONE",
					variables = "NONE",
					parameters = "NONE",
					conditionals = "italic",
					virtual_text = "NONE",
				},
			})
			vim.cmd.colorscheme("onedark")
		end,
	}

-- 	{
-- 		"catppuccin/nvim",
-- 		lazy = false,
-- 		name = "catppuccin",
-- 		priority = 1000,
-- 		config = function(_)
-- 			local colors = require("catppuccin.palettes").get_palette()
-- 			require("catppuccin").setup({
-- 				flavor = "mocha",
-- 				transparent_background = true,
-- 				integrations = {
-- 					-- aerial = true,
-- 					-- alpha = true,
-- 					-- cmp = true,
-- 					-- dashboard = true,
-- 					-- flash = true,
-- 					gitsigns = true,
-- 					-- headlines = true,
-- 					-- illuminate = true,
-- 					indent_blankline = { enabled = true },
-- 					-- leap = true,
-- 					lsp_trouble = true,
-- 					mason = true,
-- 					markdown = true,
-- 					-- mini = true,
-- 					-- native_lsp = {
-- 					--   enabled = true,
-- 					--   underlines = {
-- 					--     errors = { "undercurl" },
-- 					--     hints = { "undercurl" },
-- 					--     warnings = { "undercurl" },
-- 					--     information = { "undercurl" },
-- 					--   },
-- 					-- },
-- 					-- navic = { enabled = true, custom_bg = "lualine" },
-- 					-- neotest = true,
-- 					-- neotree = true,
-- 					-- noice = true,
-- 					-- notify = true,
-- 					-- semantic_tokens = true,
-- 					telescope = true,
-- 					treesitter = true,
-- 					treesitter_context = true,
-- 					which_key = true,
-- 				},
-- 				custom_highlights = {
-- 					Comment = { fg = colors.overlay1 },
-- 					LineNr = { fg = colors.overlay1 },
-- 					CursorLine = { bg = colors.none },
-- 					CursorLineNr = { fg = colors.lavender },
-- 					DiagnosticVirtualTextError = { bg = colors.none },
-- 					DiagnosticVirtualTextWarn = { bg = colors.none },
-- 					DiagnosticVirtualTextInfo = { bg = colors.none },
-- 					DiagnosticVirtualTextHint = { bg = colors.none },
-- 				},
-- 			})
-- 			vim.opt.termguicolors = true
-- 			vim.cmd.colorscheme("catppuccin-mocha")
-- 		end,
-- 	},
}
