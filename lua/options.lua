local cmd = vim.cmd
local o = vim.opt
local g = vim.g
local s = vim.s
local indent = 4

cmd([[
    filetype plugin indent on
]])

o.backspace = { "indent", "eol", "start" } -- allow backspacing over everything in insert mode
-- o.clipboard = "unnamedplus"  -- allows neovim to access the system clipboard
o.fileencoding = "utf-8" -- the encoding written to a file
o.encoding = "utf-8" -- the encoding
-- o.matchpairs = { "(:)", "[:]", "{:}", "<:>" }
o.syntax = "enable"

-- indentation
o.autoindent = true -- auto indentation
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = indent -- the number of spaces inserted for each indentation
o.smartindent = true -- make indenting smarter again
o.softtabstop = indent -- when hitting <BS>, pretend like a tab is removed, even if its spaces
o.tabstop = indent -- insert spaces for a tab
o.shiftround = true -- use multiples of shiftwidth when indenting with '<' and '>'

-- search
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.incsearch = true -- show search matches as you type
o.smartcase = true -- override the 'ignorecase' option if the search pattern contains upper case characters
o.wildignore = { ".git", "node_modules", "dist", "build" } -- ignore these files in wildmenu
o.wildignorecase = true -- ignore case in file names when completing
o.wildmenu = true -- visual autocomplete for command menu

-- appearance
o.laststatus = 2 -- always display the status line
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.cmdheight = 1 -- more space in the neovim command line for displaying messages
o.colorcolumn = "80" -- highlight the 80th column
o.cursorline = true -- highlight the current line
o.hidden = true -- required to keep multiple buffers open multiple buffers
o.mouse = "a" -- enable mouse support
o.number = true -- set numbered lines
o.relativenumber = true -- set relative numbered lines
o.lazyredraw = true -- faster scrolling
o.list = true -- show some invisible characters (tabs...)
o.listchars = {
	tab = "┊ ",
	trail = "·",
	extends = "»",
	precedes = "«",
	nbsp = "×",
}
o.scrolloff = 18 -- minimal number of screen lines to keep above and below the cursor
o.sidescrolloff = 3 -- minimal number of screen columns to keep to the left and to the right of the cursor
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.wrap = false -- display lines as one long line

-- backups
o.backup = false -- don't create backups
o.swapfile = false -- don't create swapfile
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), don't make a backup

-- autocomplete
o.completeopt = { "menu", "menuone", "noselect" } -- better completion
o.shortmess:append("c") -- don't pass messages to |ins-completion-menu|. This hides the extra message displayed by completion plugins and gives a better experience

o.termguicolors = true -- set term gui colors most terminals support this

-- persistent undo
-- Don"t forget to create folder $HOME/.local/share/nvim/undo
local undodir = vim.fn.stdpath("data") .. "/undo"
o.undofile = true -- enable persistent undo
o.undodir = undodir
o.undolevels = 1000
o.undoreload = 10000

-- fold
-- o.foldmethod = "marker" -- fold based on markers
-- o.foldlevel = 99

cmd.colorscheme("catppuccin")
