return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', event = "LSPAttach", config = true },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      local function common_on_attach(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end
      lsp_zero.on_attach(common_on_attach)

      -- see :help lsp-zero-guide:integrate-with-mason-nvim
      -- to learn how to use mason.nvim with lsp-zero
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { "tsserver", "rust_analyzer", "pyright", "gopls", "bashls", "vimls", "jsonls", "yamlls", "dockerls", "html", "cssls", "tailwindcss", "graphql", "efm", "lua_ls", "terraformls", "prismals", "ruff_lsp" },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
          ruff_lsp = function()
            require('lspconfig').ruff_lsp.setup({
              on_attach = function(client, bufnr)
                common_on_attach({ buffer = bufnr })

                -- Disable hover in favor of Pyright
                client.server_capabilities.hoverProvider = false

                -- Steal the idea from `eslint.lua`
                local ruff_lsp_client = require("lspconfig.util").get_active_client_by_name(bufnr,
                  "ruff_lsp")

                local request = function(method, params)
                  ruff_lsp_client.request(method, params, nil, bufnr)
                end

                local organize_imports = function()
                  request("workspace/executeCommand", {
                    command = "ruff.applyOrganizeImports",
                    arguments = {
                      { uri = vim.uri_from_bufnr(bufnr) },
                    },
                  })
                end

                vim.api.nvim_create_user_command(
                  "RuffOrganizeImports",
                  organize_imports,
                  { desc = "Ruff: Organize Imports" }
                )
              end,
            })
          end,
        }
      })

      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      require("luasnip.loaders.from_vscode").lazy_load()
      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        -- mapping = cmp.mapping.preset.insert({
        --     ['<C-p>'] = cmp.SelectPrevItem(),
        --     ['<C-n>'] = cmp.SelectNextItem(),
        --     ['<C-d>'] = cmp.SelectNextItem({behavior = cmp.SelectBehavior.Insert}),
        --     ['<C-Space>'] = cmp.SelectNextItem({behavior = cmp.SelectBehavior.Select}),
        --     ['<C-e>'] = cmp.Abort(),
        --     ['<CR>'] = cmp.SelectConfirm({behavior = cmp.ConfirmBehavior.Replace}),
        --     ['<Tab>'] = cmp.SelectConfirm({behavior = cmp.ConfirmBehavior.Replace}),
        -- }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer',  keyword_length = 3 },
          { name = 'path' },
          { name = 'luasnip', keyword_length = 2 },
          { name = 'nvim_lua' },
        },
        formatting = lsp_zero.cmp_format(),
      })
    end,
  }

}
