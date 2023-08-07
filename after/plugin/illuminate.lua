require("illuminate").configure{}

-- -- change the highlight style
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#2d2245" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#2d2245" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#2d2245" })

--- auto update the highlight style on colorscheme change
-- vim.api.nvim_create_autocmd({ "ColorScheme" }, {
--   pattern = { "*" },
--   callback = function(ev)
--     -- vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
--     -- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
--     -- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
--   end
-- })
