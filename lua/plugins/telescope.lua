return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            {
                'nvim-telescope/telescope-fzy-native.nvim',
                run = 'make',
            },
        },
        config = function()
            require("telescope").setup({})
            pcall(require("telescope").load_extension, 'fzf')

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc="Find Files"})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc="Live Grep"})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc="Buffers"})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc="Help Tags"})
            vim.keymap.set("n", "<leader>fc", builtin.commands, {desc="Commands"})
            vim.keymap.set("n", "<leader>fr", builtin.registers, {desc="Registers"})
            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {desc="Document Symbols"})
            vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, {desc="Workspace Symbols"})
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {desc="Old Files"})
            vim.keymap.set("n", "<leader>ft", builtin.filetypes, {desc="File Types"})
            vim.keymap.set("n", "<leader>fq", builtin.quickfix, {desc="Quickfix"})
            vim.keymap.set("n", "<leader>fl", builtin.loclist, {desc="Location List"})
            vim.keymap.set("n", "<leader>f:", builtin.commands, {desc="Commands"})
            vim.keymap.set("n", "<leader>fp", builtin.git_files, {desc="Git Files"})
        end,
    },
}
