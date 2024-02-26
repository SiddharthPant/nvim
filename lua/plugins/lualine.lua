return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "onedark",
				icons_enabled = true,
			},
			sections = {
				lualine_c = { { "filename", file_status = true, path = 1 } }, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
			inactive_sections = {
				lualine_c = { { "filename", file_status = true, path = 1 } },
			},
			tabline = {
				lualine_a = { { "buffers" } },
			},
		})
	end,
}
