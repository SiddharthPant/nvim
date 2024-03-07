return {
  'akinsho/bufferline.nvim',
  config = function()
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        numbers = 'buffer_id',
        middle_mouse_command = 'bdelete! %d', -- can be a string | function, | false see "Mouse actions"
        indicator = {
          style = 'underline',
        },
        diagnostics = 'nvim_lsp',
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return '(' .. count .. ')'
        end,
        separator_style = 'slant',
      },
    }
  end,
}
