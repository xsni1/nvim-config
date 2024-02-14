local M = {
    'tpope/vim-fugitive',
    config = function(_, opts)
        vim.keymap.set("n", "<leader>gs", ":vertical G<CR>")
        vim.keymap.set("n", "<leader>gl", ":vertical :0Gllog<CR>")
    end
}

return M
