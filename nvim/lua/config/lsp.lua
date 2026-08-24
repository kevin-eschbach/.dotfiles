vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            return
        end

        -- ty provides Python language intelligence; Ruff handles linting and formatting.
        if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
        end

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        end

        local opts = { buffer = event.buf, silent = true }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, {
            desc = "Go to declaration",
        }))
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", vim.tbl_extend("force", opts, {
            desc = "Show LSP definitions",
        }))
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", vim.tbl_extend("force", opts, {
            desc = "Show LSP type definitions",
        }))
        vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, {
            desc = "Code actions",
        }))
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, {
            desc = "Rename symbol",
        }))
        vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", vim.tbl_extend("force", opts, {
            desc = "Show buffer diagnostics",
        }))
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, {
            desc = "Show line diagnostics",
        }))
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1 })
        end, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1 })
        end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
        vim.keymap.set("n", "<leader>vws", "<cmd>Telescope lsp_document_symbols<CR>", vim.tbl_extend("force", opts, {
            desc = "Show document symbols",
        }))
        vim.keymap.set("n", "<leader>vf", function()
            vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
    end,
})
