local gh = function(repo)
    return "https://github.com/" .. repo
end

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
        local name = event.data.spec.name
        local kind = event.data.kind

        if name == "nvim-treesitter"
            and (kind == "install" or kind == "update")
        then
            vim.cmd.packadd("nvim-treesitter")
            vim.cmd.TSUpdate()
        end
    end,
})

vim.pack.add({
    gh("nvim-lua/plenary.nvim"),
    gh("nvim-telescope/telescope.nvim"),
    {
        src = gh("rose-pine/neovim"),
        name = "rose-pine",
    },
    {
        src = gh("nvim-treesitter/nvim-treesitter"),
        version = "master",
    },
    gh("mason-org/mason.nvim"),
    gh("neovim/nvim-lspconfig"),
    gh("mason-org/mason-lspconfig.nvim"),
    gh("catgoose/nvim-colorizer.lua"),
    gh("tpope/vim-fugitive"),
    gh("nvim-mini/mini.snippets"),
    gh("rafamadriz/friendly-snippets"),

})

require("nvim-treesitter.configs").setup({
    indent = { enable = true },
    ensure_installed = {
        "bash",
        "diff",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "regex",
        "typescript",
        "vim",
        "vimdoc",
    },
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})

require("rose-pine").setup({
    styles = {
        transparency = true,
    },
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "ruff",
        "ty",
        "ts_ls",
        "eslint",
        "lua_ls",
    },
    automatic_enable = true,
})
