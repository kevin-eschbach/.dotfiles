local M = {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('v', '<leader>fg', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.builtin, {})
vim.keymap.set('n', '<leader>fn', function()
builtin.find_files({cwd="~/notes"}) end, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})

return { M }
