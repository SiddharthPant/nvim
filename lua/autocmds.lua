-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ':%s/\\s\\+$//e',
})

-- Auto format on save using the attached (optionally filtered) language servere clients
-- https://neovim.io/doc/user/lsp.html#vim.lsp.buf.format()
-- autocmd("BufWritePre", {
--   pattern = "",
--   command = ":silent lua vim.lsp.buf.format()"
-- })

-- Don"t auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o',
})

-- autocmd("Filetype", {
-- 	pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua", "prisma" },
-- 	command = "setlocal shiftwidth=2 tabstop=2",
-- })
--
-- -- Set colorcolumn
-- autocmd("Filetype", {
-- 	pattern = { "python", "rst", "c", "cpp" },
-- 	command = "set colorcolumn=80",
-- })
--
-- autocmd("Filetype", {
-- 	pattern = { "gitcommit", "markdown", "text" },
-- 	callback = function()
-- 		vim.opt_local.wrap = true
-- 		vim.opt_local.spell = true
-- 	end,
-- })

-- vim.filetype.add({
--   -- Detect and assign filetype based on the extension of the filename
--   extension = {
--     mdx = "mdx",
--     log = "log",
--     conf = "conf",
--     env = "dotenv",
--   },
--   -- Detect and apply filetypes based on the entire filename
--   filename = {
--     [".env"] = "dotenv",
--     ["env"] = "dotenv",
--     ["tsconfig.json"] = "jsonc",
--   },
--   -- Detect and apply filetypes based on certain patterns of the filenames
--   pattern = {
--     -- INFO: Match filenames like - ".env.example", ".env.local" and so on
--     ["%.env%.[%w_.-]+"] = "dotenv",
--   },
-- })
