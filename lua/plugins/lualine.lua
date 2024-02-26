return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "onedark",
				icons_enabled = true,
			},
			sections = {
				lualine_c = {},
			},
			inactive_sections = {
				lualine_c = {},
			},
			tabline = {},
			winbar = {
				lualine_a = {},
				lualine_b = { { "filename", file_status = false, path = 2 } }, -- 0 = just filename, 1 = relative path, 2 = absolute path
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = { { "filename", file_status = false, path = 2 } }, -- 0 = just filename, 1 = relative path, 2 = absolute path
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = {
				"trouble",
				"fzf",
				"nvim-dap-ui",
				"fugitive",
				"mason",
				"lazy",
				"man",
				"quickfix",
			},
		})
	end,
}
