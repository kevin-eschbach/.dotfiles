local M = {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
}

--require('telescope').setup{
--defaults = {
--        layout_config = {
--            horizontal = {
--                preview_cutoff = 0,
--            }
--        }
--    }
--
--}

local builtin = require('telescope.builtin')

-- finds files in current dir
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- search file contents in current dir
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- search buffers
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
-- searches help tags for builting methods
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- searches file contents with highlighted string
vim.keymap.set('v', '<leader>fg', builtin.grep_string, {})
-- searches builtin methods to execute
vim.keymap.set('n', '<leader>fb', builtin.builtin, {})
-- searches all the references
vim.keymap.set({'v', 'n'}, '<leader>fr', builtin.lsp_references, {})
-- search incoming calls
vim.keymap.set({'v', 'n'}, '<leader>fi', builtin.lsp_incoming_calls, {})
-- search outgoing calls
vim.keymap.set({'v', 'n'}, '<leader>fo', builtin.lsp_outgoing_calls, {})
-- search treesitter variables and functions
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
-- fuzzy find the current file
vim.keymap.set({'n', 'v'}, '<leader>fz', builtin.current_buffer_fuzzy_find, {})


return { M }
