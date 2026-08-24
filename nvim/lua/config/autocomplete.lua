vim.opt.autocomplete = true

vim.opt.complete = {
	"o", -- LSP omnifunc
	".", -- current buffer
	"b", -- loaded buffers
}

vim.opt.completeopt = {
	"menuone",
	"noselect",
	"popup",
	"fuzzy",
}
