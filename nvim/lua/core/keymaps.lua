vim.g.mapleader = " "

local keymap = vim.keymap

-- increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Vertical split" })
keymap.set("n", "<leader>ss", "<C-w>s", { desc = "Horizontal split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make vertical windows the same size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

local resize_opts = { noremap = true, silent = true }

keymap.set("n", "<M-h>", "<cmd>vertical resize -2<CR>", resize_opts)
keymap.set("n", "<M-l>", "<cmd>vertical resize +2<CR>", resize_opts)
keymap.set("n", "<M-j>", "<cmd>resize +2<CR>", resize_opts)
keymap.set("n", "<M-k>", "<cmd>resize -2<CR>", resize_opts)

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current buffer in new tab" })

-- snacks
-- scratch
keymap.set("n", "<leader>So", function()
	Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })
keymap.set("n", "<leader>S", function()
	Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })

-- terminal (toggleterm for basic terminal)
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- terminal mode keybindings
keymap.set("t", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
keymap.set("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Navigate to left window" })
keymap.set("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Navigate to bottom window" })
keymap.set("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Navigate to top window" })
keymap.set("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Navigate to right window" })
