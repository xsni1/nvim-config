local M = {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.4',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = function()
		local actions = require("telescope.actions")

		return {
			defaults = {
				mappings = {
					i = {
						['<C-j>'] = actions.move_selection_next,
						['<C-k>'] = actions.move_selection_previous
					}
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		local builtin = require('telescope.builtin')

		telescope.setup(opts)
		vim.keymap.set('n', '<leader>f', builtin.find_files, {})
		vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
		vim.keymap.set('n', '<leader>df', builtin.diagnostics, {})
		vim.keymap.set('n', '<leader>gg', '<cmd>Telescope live_grep<cr>', {})
		vim.keymap.set('n', '<leader>ps', builtin.grep_string, {})
	end
}

return M
