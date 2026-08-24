local snippets = require("mini.snippets")
local loader = snippets.gen_loader

snippets.setup({
	snippets = {
		loader.from_lang({
			lang_patterns = {
				python = {
					"python/**/*.json",
					"**/python.json",
					"frameworks/django/**/*.json",
				},
				htmldjango = {
					"html.json",
					"frameworks/djangohtml.json",
				},
			},
		}),
	},
})

snippets.start_lsp_server({ match = false })
