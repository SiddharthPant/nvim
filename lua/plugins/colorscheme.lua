return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function(_)
			local colors = require("catppuccin.palettes").get_palette()
			require("catppuccin").setup({
				flavor = "latte",
				transparent_background = true,
				integrations = {
					-- aerial = true,
					-- alpha = true,
					-- cmp = true,
					-- dashboard = true,
					-- flash = true,
					gitsigns = true,
					-- headlines = true,
					-- illuminate = true,
					indent_blankline = { enabled = true },
					-- leap = true,
					lsp_trouble = true,
					mason = true,
					markdown = true,
					-- mini = true,
					-- native_lsp = {
					--   enabled = true,
					--   underlines = {
					--     errors = { "undercurl" },
					--     hints = { "undercurl" },
					--     warnings = { "undercurl" },
					--     information = { "undercurl" },
					--   },
					-- },
					-- navic = { enabled = true, custom_bg = "lualine" },
					-- neotest = true,
					-- neotree = true,
					-- noice = true,
					-- notify = true,
					-- semantic_tokens = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					which_key = true,
				},
				custom_highlights = {
					Comment = { fg = colors.overlay1 },
					LineNr = { fg = colors.overlay1 },
					CursorLine = { bg = colors.none },
					CursorLineNr = { fg = colors.lavender },
					DiagnosticVirtualTextError = { bg = colors.none },
					DiagnosticVirtualTextWarn = { bg = colors.none },
					DiagnosticVirtualTextInfo = { bg = colors.none },
					DiagnosticVirtualTextHint = { bg = colors.none },
				},
			})
			vim.opt.termguicolors = true
			vim.cmd.colorscheme("catppuccin-latte")
		end,
	},
}
