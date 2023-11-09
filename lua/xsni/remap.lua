vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "ggzz")

vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

vim.keymap.set("n", "*", "*zz")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "[q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "]q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- better navigation --
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-l>h")
vim.keymap.set("n", "<C-j>", "<C-j>h")
vim.keymap.set("n", "<C-k>", "<C-k>h")

-- trouble
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)

-- nvim tree
-- vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", ":Neotree filesystem reveal right toggle<CR>")


-- vim.opt.guifont = { "JetBrains Mono:h11" }

-- buffers
-- vim.keymap.set("n", "<C-9>", ":bprev<CR>", { nowait = true })
-- vim.keymap.set("n", "<C-0>", ":bnext<CR>", { nowait = true })

-- lazygit toggleterm
-- vim.keymap.set("n", "<leader>vc", ":TermExec cmd='lazygit' direction='float'<cr>")
-- vim.keymap.set("n", "<leader>`", ":ToggleTerm direction='float'<cr>")
-- vim.keymap.set("t", "<leader>`", "<C-\\><C-n>", { noremap = true, silent = true })

-- scroll up/down
-- vim.keymap.set("n", "<C-;>", "<C-e>")
-- vim.keymap.set("n", "<C-'>", "<C-y>")

-- vim.keymap.set("n", "<cr>", "ciw")
vim.keymap.set("v", "y", "ygv<esc>")
-- tab next/prev
vim.keymap.set("n", "tk", ":tabnext<CR>")
vim.keymap.set("n", "tj", ":tabprev<CR>")
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "td", ":tabclose<CR>")

-- Yank into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- yank motion
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- yank line

-- Delete into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>d', '"+d') -- delete motion
vim.keymap.set({'n', 'v'}, '<leader>D', '"+D') -- delete line

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')  -- paste after cursor
vim.keymap.set('n', '<leader>P', '"+P')  -- paste before cursor
