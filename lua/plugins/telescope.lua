return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-symbols.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	-- keys = keys,
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				sorting_strategy = "descending",
				initial_mode = "insert",
				file_ignore_patterns = {
					"**/.terraform/*",
					"*.egg-info",
					".*_cache",
					".DS_Store",
					".Rproj.user",
					".cache/",
					".git/",
					".venv",
					"__pycache__/*",
					"renv/*",
				},
				mappings = {
				  n = {
				    ['v'] = actions.file_vsplit,
				    ['<S-k>'] = actions.preview_scrolling_up,
				    ['<S-j>'] = actions.preview_scrolling_down,
				  },
				  i = {
				    ['<C-v>'] = actions.file_vsplit,
				    ['<S-k>'] = actions.preview_scrolling_up,
				    ['<S-j>'] = actions.preview_scrolling_down,
				    ['<C-j>'] = actions.move_selection_next,
				    ['<C-k>'] = actions.move_selection_previous,
				  },
				},
			},
			pickers = {
				buffers = {
					initial_mode = "normal",
					mappings = {
						i = {
							["<C-q>"] = "delete_buffer",
						},
						n = {
							["q"] = "delete_buffer",
						},
					},
				},
				diagnostics = {
					initial_mode = "normal",
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
				find_files = {
					find_command = { "rg", "--files", "--color", "never", "--follow" },
					initial_mode = "insert",
					hidden = true,
					no_ignore = false,
					disable_devicons = false,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
																					-- the default case_mode is "smart_case"
				},
				file_browser = {
					initial_mode = "normal",
					hijack_netrw = true,
					hidden = true,
					grouped = true,
					path = "%:p:h",
					cwd = "%:p:h",
					respect_gitignore = false,
					-- dir_icon = "",
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("file_browser")

		local builtin = require("telescope.builtin")

		-- Middleware to resume picker command from last search
		local _last_picker = nil
		local _last_ctx = nil
		local function telescope_middleware(func, ctxfunc)
			local function inner()
				local ctx = nil
				if ctxfunc ~= nil then
					ctx = ctxfunc()
				end
				if func == _last_picker and vim.deep_equal(ctx, _last_ctx) then
					builtin.resume()
				else
					_last_picker = func
					_last_ctx = ctx
					func()
				end
			end
			return inner
		end

		vim.keymap.set("n", "<leader>ff", telescope_middleware(builtin.find_files), { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", telescope_middleware(builtin.live_grep), { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>fb", telescope_middleware(builtin.buffers), { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", telescope_middleware(builtin.help_tags), { desc = "Help Tags" })
		vim.keymap.set("n", "<leader>fc", telescope_middleware(builtin.commands), { desc = "Commands" })
		vim.keymap.set("n", "<leader>fr", telescope_middleware(builtin.registers), { desc = "Registers" })
		vim.keymap.set("n", "<leader>fs", telescope_middleware(builtin.lsp_document_symbols), { desc = "Document Symbols" })
		vim.keymap.set("n", "<leader>fw", telescope_middleware(builtin.lsp_workspace_symbols), { desc = "Workspace Symbols" })
		vim.keymap.set("n", "<leader>fo", telescope_middleware(builtin.oldfiles), { desc = "Old Files" })
		vim.keymap.set("n", "<leader>ft", telescope_middleware(builtin.filetypes), { desc = "File Types" })
		vim.keymap.set("n", "<leader>fq", telescope_middleware(builtin.quickfix), { desc = "Quickfix" })
		vim.keymap.set("n", "<leader>fl", telescope_middleware(builtin.loclist), { desc = "Location List" })
		vim.keymap.set("n", "<leader>f:", telescope_middleware(builtin.commands), { desc = "Commands" })
		vim.keymap.set("n", "<leader>fp", telescope_middleware(builtin.git_files), { desc = "Git Files" })
		vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "File Browser", noremap = true })
	end,
}
