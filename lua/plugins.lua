return {
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
          vim.g.startuptime_tries = 10
        end,
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { theme = "catppuccin" }
    },
    "github/copilot.vim",
    "laytan/cloak.nvim",
    "tpope/vim-fugitive",
    { "folke/which-key.nvim", opts = {} },
}
