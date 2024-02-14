local M = {
    'RRethy/vim-illuminate',
    config = function(_, opts)
        vim.cmd([[ autocmd VimEnter * lua require("illuminate").configure{} ]])

        vim.defer_fn(function()
            vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#333333" })
            vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#333333" })
            vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#333333" })
            -- vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#2d2245" })
            -- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#2d2245" })
            -- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#2d2245" })
        end, 100)
    end
}

return M
