return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "...",
                    package_uninstalled = "x",
                },
            },
        })

        ---@diagnostic disable-next-line: missing-fields
        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "html",
                "cssls",
                "lua_ls",
                "pylsp",
                "gopls",
            },
        })


        mason_tool_installer.setup({
            auto_enable = true,
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
--                "isort", -- python formatter
                "black", -- python formatter
                "mypy",
                "pylint",
                "eslint_d",
            },
        })
    end,
}
