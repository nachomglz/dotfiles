local opt = vim.opt

-- setup relative numbers
opt.relativenumber = true
opt.number = true

-- setup scrolloff
opt.scrolloff = 8

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
-- opt.termguicolors = true
-- opt.signcolumn = "yes"

-- backspace setup
opt.backspace = "indent,eol,start" -- allow backspace on ident, end of line or insert mode start position

-- copy yanked text to clipboard
opt.clipboard:append("unnamedplus")

-- split windows options
opt.splitright = true
opt.splitbelow = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

--  global status line for panes/windows
-- opt.laststatus = 3

-- folding
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = ""
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- silence deprecated warning from telescope jump to definition

-- Silence the specific position encoding message
local notify_original = vim.notify
vim.notify = function(msg, ...)
	if
		msg
		and (
			msg:match("position_encoding param is required")
			or msg:match("Defaulting to position encoding of the first client")
			or msg:match("multiple different client offset_encodings")
		)
	then
		return
	end
	return notify_original(msg, ...)
end

opt.background = "dark"
