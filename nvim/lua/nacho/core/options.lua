vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- setup relative numbers
opt.relativenumber = true
opt.number = true

-- setup scrolloff
opt.scrolloff = 12

-- indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting a new line

-- disable line wraping
opt.wrap = false

-- searching
opt.ignorecase = true -- ignore case letters when searching
opt.smartcase = true -- search case sensitive if you add case letters when searching

-- highlight cursor line
opt.cursorline = true

-- turn on termguicolors
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace setup
opt.backspace = "indent,eol,start" -- allow backspace on ident, end of line or insert mode start position

-- copy yanked text to clipboard
opt.clipboard:append("unnamedplus")

-- split windows options
opt.splitright = true
opt.splitbelow = true
