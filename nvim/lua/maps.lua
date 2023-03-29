local keymap = vim.keymap

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return>', { silent = true })

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<h>', '<C-w>h')
keymap.set('', 's<j>', '<C-w>k')
keymap.set('', 's<k>', '<C-w>j')
keymap.set('', 's<l>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
-- Resize window
keymap.set('n', '<Space><left>', '<C-w><')
keymap.set('n', '<Space><right>', '<C-w>>')
keymap.set('n', '<Space><up>', '<C-w>+')
keymap.set('n', '<Space><down>', '<C-w>-')
