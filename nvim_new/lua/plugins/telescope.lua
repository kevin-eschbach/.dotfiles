local M = {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
}

require('telescope').setup{
defaults = {
        layout_config = {
            horizontal = {
                preview_cutoff = 0,
            }
        }
    }

}


return { M }
