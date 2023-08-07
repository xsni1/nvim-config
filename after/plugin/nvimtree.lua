-- require'nvim-tree.events'.on_nvim_tree_ready(function ()
--   vim.cmd("NvimTreeRefresh")
-- end)

-- local function open_nvim_tree()
--     require("nvim-tree.api").tree.open()
-- end
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- -- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- -- OR setup with some options
-- require("nvim-tree").setup({
--   sort_by = "case_sensitive",
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
--   view = {
--       side = 'right'
--   },
--   update_focused_file = {
--       enable = true,
--       update_root = true,
--   }
-- })
