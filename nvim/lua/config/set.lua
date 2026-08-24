vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.conceallevel = 0
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.confirm = true

vim.g.mapleader = " "

vim.filetype.add({
	pattern = {
		[".*/templates/.*%.html"] = "htmldjango",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"css",
		"html",
		"htmldjango",
		"javascript",
		"javascriptreact",
		"json",
		"typescript",
		"typescriptreact",
	},
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.shiftwidth = 2
	end,
})
