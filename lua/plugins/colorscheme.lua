return {
  -- {
  --   'miikanissi/modus-themes.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'modus'
  --     require('modus-themes').setup {
  --       -- Theme comes in two styles `modus_operandi` and `modus_vivendi`
  --       -- `auto` will automatically set style based on background set with vim.o.background
  --       style = 'auto',
  --       variant = 'default', -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
  --       transparent = false, -- Transparent background (as supported by the terminal)
  --     }
  --   end,
  -- },
  -- return {
  --   { -- You can easily change to a different colorscheme.
  --     -- Change the name of the colorscheme plugin below, and then
  --     -- change the command in the config to whatever the name of that colorscheme is
  --     --
  --     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  --     'folke/tokyonight.nvim',
  --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --     priority = 1000, -- make sure to load this before all the other start plugins
  --     config = function()
  --       require('tokyonight').setup {
  --         styles = {
  --           -- Style to be applied to different syntax groups
  --           -- Value is any valid attr-list value for `:help nvim_set_hl`
  --           -- comments = { italic = true },
  --           keywords = { italic = true, bold = true },
  --           -- functions = {},
  --           -- variables = {},
  --           -- Background styles. Can be "dark", "transparent" or "normal"
  --           -- sidebars = "dark", -- style for sidebars, see below
  --           -- floats = "dark", -- style for floating windows
  --         },
  --       }
  --       -- Load the colorscheme here
  --       vim.cmd.colorscheme 'tokyonight-day'
  --
  --       -- You can configure highlights by doing something like
  --       -- vim.cmd.hi 'Comment gui=none'
  --     end,
  --   },

  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    config = function(_)
      local colors = require('catppuccin.palettes').get_palette()
      require('catppuccin').setup {
        flavor = 'mocha',
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
      }
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}
