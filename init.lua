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
vim.opt.termguicolors = true

local spec = {
  { 'folke/which-key.nvim',  config = true },
  { "nvim-lua/plenary.nvim", lazy = true },
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
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { theme = "catppuccin" }
  },
  "github/copilot.vim",
  "laytan/cloak.nvim",
  "tpope/vim-fugitive",
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  { import = "plugins" },
}

require("lazy").setup({
  spec = spec,
  install = {
    colorscheme = { "catppuccin", "habamax" },
  },
  checker = {
    enabled = true,
  },
})

require("options")
require("keymaps")
require("autocmds")
