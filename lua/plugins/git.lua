return {
  'tpope/vim-rhubarb',
  'tpope/vim-fugitive',
  'kdheepak/lazygit.nvim',
  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
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
}
