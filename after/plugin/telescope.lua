local actions = require('telescope.actions')
-- local cf_actions = require('telescope').extensions.changed_files.actions
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous
            }
        }
    },
    pickers = {
        -- find_files = {
        --     hidden = true
        -- },
        live_grep = {
            additional_args = function(opts)
                return { "--hidden" }
            end
        },
        git_branches = {
            mappings = {
                i = {
                    -- ["<C-f>"] = cf_actions.find_changed_files,
                    ["<CR>"] = function(prompt_bufnr)
                        -- get the selected file name
                        local entry = require("telescope.actions.state").get_selected_entry()
                        -- close telescope
                        require("telescope.actions").close(prompt_bufnr)
                        -- open diffview
                        vim.cmd('DiffviewOpen ' .. entry.name)
                    end,
                }
            }
        },
        git_commits = {
            mappings = {
                i = {
                    -- ["<C-f>"] = cf_actions.find_changed_files,
                    ["<CR>"] = function(prompt_bufnr)
                        -- get the selected commit hash
                        local entry = require("telescope.actions.state").get_selected_entry()
                        -- close telescope
                        require("telescope.actions").close(prompt_bufnr)
                        -- open diffview
                        vim.cmd('DiffviewOpen ' .. entry.value)
                    end,
                }
            }
        },
    }
}

-- vim.api.nvim_set_keymap('n', '<leader>sF', [[:lua require('telescope.builtin').find_files({
-- find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<CR>'] .. "'" .. vim.fn.expand('<cword>') .. "'", {expr = true})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>df', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>gg', '<cmd>Telescope live_grep<cr>', {})
vim.keymap.set('n', '<leader>ps', builtin.grep_string, {})
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
vim.keymap.set('n', '<leader>b',
    function()
        builtin.buffers({
            sort_mru = true,
            ignore_current_buffer = true
        })
    end)
vim.keymap.set('n', '<leader>bf', builtin.git_branches, {})
vim.keymap.set('n', '<leader>cf', builtin.git_commits, {})
-- vim.keymap.set("n", ";", "<cmd>lua require('telescope.builtin').resume(require('telescope.themes'))<cr>", opts)
