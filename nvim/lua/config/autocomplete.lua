vim.opt.autocomplete = true

vim.opt.complete = {
    "o", -- LSP omnifunc
    ".", -- current buffer
    "w", -- buffers in other windows
    "b", -- loaded buffers
    "u", -- unloaded buffers
}

vim.opt.completeopt = {
    "menuone",
    "noselect",
    "popup",
    "fuzzy",
}
