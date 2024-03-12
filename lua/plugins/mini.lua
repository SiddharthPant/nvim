return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  -- 'nvim-lualine/lualine.nvim',
  -- config = function()
  --   require('lualine').setup {
  --     options = {
  --       theme = 'tokyonight',
  --       icons_enabled = true,
  --       -- disabling section separators fixes
  --       -- the disappearing start screen issue
  --       section_separators = '',
  --     },
  --     sections = {
  --       lualine_c = {},
  --     },
  --     inactive_sections = {
  --       lualine_c = {},
  --     },
  --     tabline = {},
  --     winbar = {
  --       lualine_a = {},
  --       lualine_b = { { 'filename', file_status = false, path = 2 } }, -- 0 = just filename, 1 = relative path, 2 = absolute path
  --       lualine_c = {},
  --       lualine_x = {},
  --       lualine_y = {},
  --       lualine_z = {},
  --     },
  --     inactive_winbar = {
  --       lualine_a = {},
  --       lualine_b = { { 'filename', file_status = false, path = 2 } }, -- 0 = just filename, 1 = relative path, 2 = absolute path
  --       lualine_c = {},
  --       lualine_x = {},
  --       lualine_y = {},
  --       lualine_z = {},
  --     },
  --     extensions = {
  --       'trouble',
  --       'fzf',
  --       'nvim-dap-ui',
  --       'fugitive',
  --       'mason',
  --       'lazy',
  --       'man',
  --       'quickfix',
  --     },
  --   }
  -- end,
}
