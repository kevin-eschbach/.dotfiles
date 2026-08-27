require("conform").setup({
	formatters_by_ft = {
		css = { "prettier" },
		html = { "prettier" },
		htmldjango = { "djlint" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
	},
	formatters = {
		djlint = {
			prepend_args = { "--profile", "django" },
		},
	},
})

vim.keymap.set({ "n", "v" }, "<leader>vf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
