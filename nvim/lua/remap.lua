vim.g.mapleader=" "
vim.keymap.set("n","<leader>pv",vim.cmd.Ex)

--When we select lines in visual mode, holding "J" and "K" will move it upwards and downwards respectively
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Tab/Shift+tab to indent/dedent
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("n", "<Tab>", "v><C-\\><C-N>")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("n", "<S-Tab>", "v<<C-\\><C-N>")
vim.keymap.set("i", "<S-Tab>", "<C-\\><C-N>v<<C-\\><C-N>^i")

-- Cursor stays in postions after moving up/down in page
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Copy from Vim to Clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
