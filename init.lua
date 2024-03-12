-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true

local spec = {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },
  { 'nvim-lua/plenary.nvim', lazy = true },
  'nvim-tree/nvim-web-devicons',
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', config = true },
  'github/copilot.vim',
  'tpope/vim-rhubarb',
  'tpope/vim-fugitive',
  {
    'NeogitOrg/neogit',
    dependencies = {
      -- 'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      -- 'nvim-telescope/telescope.nvim', -- optional
      -- 'ibhagwan/fzf-lua', -- optional
    },
    config = function()
      require('neogit').setup {
        -- disable_commit_confirmation = true,
        -- disable_builtin_notifications = true,
        -- disable_signs = false,
        -- disable_context_highlighting = false,
      }
    end,
  },
  {
    'otavioschwanck/arrow.nvim',
    opts = {
      show_icons = true,
      leader_key = ',', -- Recommended to be a single key
    },
  },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', opts = { signs = false } },
  { import = 'plugins' },
}

require('lazy').setup {
  spec = spec,
  install = {
    colorscheme = { 'tokyonight', 'habamax' },
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
}

require 'options'
require 'keymaps'
require 'autocmds'
