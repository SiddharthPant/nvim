local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

local spec = {
	{ "folke/which-key.nvim", config = true },
	{ "nvim-lua/plenary.nvim", lazy = true },
	-- "nvim-tree/nvim-web-devicons",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", config = true },
 	{
 		"nvim-lualine/lualine.nvim",
		config = function()
			require('lualine').setup({
				options = {
					theme = "catppuccin",
					icons_enabled = false,
					section_separators = '',
					component_separators = '|',
				}
			})
		end,
 	},
	"github/copilot.vim",
	"tpope/vim-fugitive",
	{ import = "plugins" },
}

require("lazy").setup({
	spec = spec,
	install = {
		colorscheme = { "catppuccin", "habamax" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
})

require("options")
require("keymaps")
require("autocmds")
