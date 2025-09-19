vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear serach highlights" })

-- increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Vertical split" })
keymap.set("n", "<leader>ss", "<C-w>s", { desc = "Horizontal split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make vertical windows the same size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Resize panes (with tmux plugin)
-- keymap.del({ "n", "i", "v" }, "<A-j>")
-- keymap.del({ "n", "i", "v" }, "<A-k>")
-- keymap.del("n", "<C-Left>")
-- keymap.del("n", "<C-Down>")
-- keymap.del("n", "<C-Up>")
-- keymap.del("n", "<C-Right>")

local resize_opts = { noremap = true, silent = true }

keymap.set("n", "<M-h>", '<cmd>lua require("tmux").resize_left()<cr>', resize_opts)
keymap.set("n", "<M-j>", '<cmd>lua require("tmux").resize_bottom()<cr>', resize_opts)
keymap.set("n", "<M-k>", '<cmd>lua require("tmux").resize_top()<cr>', resize_opts)
keymap.set("n", "<M-l>", '<cmd>lua require("tmux").resize_right()<cr>', resize_opts)
--
-- Tmux/Vim Nagivation
keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", resize_opts)
keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", resize_opts)
keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", resize_opts)
keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", resize_opts)
keymap.set("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<cr>", resize_opts)

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current buffer in new tab" })

-- text management
vim.keymap.set("n", "<leader>r", ":%s/<C-r><C-w>/", { desc = "Replace word under cursor" })

vim.keymap.set({ "v" }, "<leader>rl", function()
	return ":s/<C-r><C-w>/ /g<left><left><C-h>"
end, { expr = true, desc = "Replace word under cursor in selected lines" })

-- Dbee
keymap.set("n", "<leader>do", function() require("dbee").open() end, { desc = "Open dbee UI" })
keymap.set("n", "<leader>dc", function() require("dbee").close() end, { desc = "Close dbee UI" })
keymap.set("n", "<leader>dt", function() require("dbee").toggle() end, { desc = "Toggle dbee UI" })
