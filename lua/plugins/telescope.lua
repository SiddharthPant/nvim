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
		local trouble = require("trouble.providers.telescope")

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
						["<c-t>"] = trouble.open_with_trouble,
				  },
				  i = {
						["<c-t>"] = trouble.open_with_trouble,
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

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Registers" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document Symbols" })
		vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Old Files" })
		vim.keymap.set("n", "<leader>ft", builtin.filetypes, { desc = "File Types" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix" })
		vim.keymap.set("n", "<leader>fl", builtin.loclist, { desc = "Location List" })
		vim.keymap.set("n", "<leader>f:", builtin.commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>fp", builtin.git_files, { desc = "Git Files" })
		vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "File Browser", noremap = true })
		vim.keymap.set("n", "<leader>fj", ":Telescope resume<CR>", { desc = "Resume last picker", noremap = true })
	end,
}
